package com.unam.fciencias.pumadex.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.unam.fciencias.pumadex.modelo.Usuario;
import com.unam.fciencias.pumadex.repositorio.CalificacionesRepositorio;
import com.unam.fciencias.pumadex.repositorio.DisciplinaRepositorio;
import com.unam.fciencias.pumadex.repositorio.UsuarioRepositorio;
import com.unam.fciencias.pumadex.servicio.DisciplinaServicio;
import com.unam.fciencias.pumadex.servicio.EnviaEmailServicio;
import com.unam.fciencias.pumadex.servicio.UsuarioServicio;


@Controller
public class Controlador {

    @Autowired
    private UsuarioRepositorio usuarioRepositorio;
    @Autowired
    private EnviaEmailServicio enviaEmailServicio;
    @Autowired
    private UsuarioServicio usuarioServicio;
    @Autowired
    private CalificacionesRepositorio calificacionesRepositorio;
    @Autowired
    private DisciplinaServicio disciplinaServicio;
    @Autowired
    private DisciplinaRepositorio disciplinaRepositorio;

    @RequestMapping("/")
    public String index(Model model, String error, Principal principal) {
        model.addAttribute("disciplinas", disciplinaRepositorio.findAll());
        if (error != null) {
            model.addAttribute("error", true);
        }

        if (principal != null) {
            return "redirect:/home";
        }
        return "index";
    }

    @RequestMapping("/home")
    public String homeReq(Model model, RedirectAttributes redirectAttrs){
        if(currentUser().getStatus()==0){
            redirectAttrs.addFlashAttribute("error",true);
            return "redirect:/salir";
        }
        
        final String email = SecurityContextHolder.getContext().getAuthentication().getName();
        //System.out.println(email);
        model.addAttribute("nombreUsuario", usuarioRepositorio.findByEmail(email).getNombre());
        return "home";
    }
 
    @RequestMapping("/salir")
    public String salir(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        SecurityContextHolder.clearContext();
        session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        for (Cookie cookie : request.getCookies()) {
            cookie.setMaxAge(0);
        }
        return "redirect:/";
    }

    @RequestMapping("/403")
    public String accessDenied() {
        return "403";
    }

    @RequestMapping("/ajustes")
    public String accountSettings(Model model) {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        Usuario currentUser = usuarioRepositorio.findByEmail(email);
        model.addAttribute("usuarioActivo", currentUser);
        return "vista-detalles-cuenta";
    }


    @RequestMapping("/enviar-mail")
    public String enviarMail(HttpServletRequest request, Model model, RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
        try {
            enviaEmailServicio.sendEmail("quiquealtni@gmail.com", "[DEMO-PUMADEX]", "Hola esto es un demo!");
        } catch (Exception e) {            
            redirectAttrs.addFlashAttribute("error",true);
        }
        return "redirect:"+referer;
    }

    @PostMapping("/actualizar-contraseña")
    public String updatePassword(HttpServletRequest request, Model model,RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
        BCryptPasswordEncoder b = new BCryptPasswordEncoder();
        if(!b.matches(request.getParameter("oldPassword"),currentUser().getPassword())){           
            redirectAttrs.addFlashAttribute("errorMsg","La contraseña actual proporcionada no coincide con la registrada.");
            redirectAttrs.addFlashAttribute("incorrectPassword",true);
        }else{
            try {
                if(b.matches(request.getParameter("newPassword"),currentUser().getPassword())){
                    redirectAttrs.addFlashAttribute("errorMsg","La nueva contraseña no puede ser igual a la anterior.");
                    redirectAttrs.addFlashAttribute("incorrectPassword",true);
                }else{

                    String newPassword = new BCryptPasswordEncoder().encode(request.getParameter("newPassword")); 
                    //actualizar la contraseña.
                    usuarioServicio.actualizaContraseña(currentUser().getIdUsuario(), newPassword);
                    String msjCorreo = "Hola " + currentUser().getNombre()+ ": \nSu contraseña de ingreso al sistema pumadex ha sido actualizada.\nSi usted no lo ha hecho por favor pónganse en contacto con nosotros.";
                    String asunto = "[PUMADEX] Cambio de contraseña";
                    //enviaEmailServicio.sendEmail("quiquealtni@ciencias.unam.mx",asunto, msjCorreo);
                    enviaEmailServicio.sendEmail(currentUser().getEmail(), asunto, msjCorreo);
                    redirectAttrs.addFlashAttribute("success",true);
                }               
            } catch (Exception e) {
                redirectAttrs.addFlashAttribute("error",true);
            }
        }
        return "redirect:"+referer;
    }

    @RequestMapping("/posiciones")
    public String tablaPosiciones(Model model){
        model.addAttribute("posiciones", calificacionesRepositorio.getPosiciones());
        return "vista-tabla-posiciones";
    }

    public Usuario currentUser(){
        return usuarioRepositorio.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
    }

    @Bean(name = "urlService")
    @Primary
    public DisciplinaServicio getNombreDisciplina(){
        return disciplinaServicio;
    }
}
