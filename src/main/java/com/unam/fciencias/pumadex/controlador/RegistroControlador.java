package com.unam.fciencias.pumadex.controlador;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.unam.fciencias.pumadex.modelo.Usuario;
import com.unam.fciencias.pumadex.repositorio.UsuarioRepositorio;
import com.unam.fciencias.pumadex.servicio.EnviaEmailServicio;
import com.unam.fciencias.pumadex.servicio.UsuarioServicio;
import com.unam.fciencias.pumadex.util.Rol;

@Controller
@RequestMapping("/registro")
public class RegistroControlador {

    @Autowired
    private UsuarioRepositorio usuarioRepositorio;
    @Autowired
    private UsuarioServicio usuarioServicio;
    @Autowired
    private EnviaEmailServicio enviaEmailServicio;

    @PostMapping("/entrenador")
    public String agrega(HttpServletRequest request, Model model, RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
        String email = request.getParameter("emailF");
        String rfc = request.getParameter("rfc");
        boolean existeEmail = usuarioRepositorio.existsUsuarioByEmail(email);
        boolean existeRfc = usuarioRepositorio.existsUsuarioByEmail(rfc);
        if(existeEmail||existeRfc){
            redirectAttrs.addFlashAttribute("errorRegistro", true);
            redirectAttrs.addFlashAttribute("emailEntrenador",email);
            redirectAttrs.addFlashAttribute("rfcEntrenador",rfc);
            
        }else{
          
            String password = new BCryptPasswordEncoder().encode(request.getParameter("passwordF")); 
            Usuario usuario = usuarioServicio.agregaUsuario(request.getParameter("nombre"), request.getParameter("ap-paterno"), 
                                                        request.getParameter("ap-materno"), request.getParameter("telefono"), 
                                                        email, password, 1, request.getParameter("nombre-disciplina"),
                                                        rfc , null, null, Rol.ROLE_ENTRENADOR);
            model.addAttribute("usuario", usuario);
            redirectAttrs.addFlashAttribute("success", true);
            redirectAttrs.addFlashAttribute("action", "agregado");
            redirectAttrs.addFlashAttribute("emailEntrenador",email);
            try {
                enviaEmailServicio.sendEmail(email, "[PUMADEX] Registro exitoso", "Hola, " + request.getParameter("nombre") + ". ¡Su cuenta del Sistema Pumadex fue registrada exitosamente!");
            } catch (Exception e) {            
                System.out.println("El envio de mails no esta disponible.");
            }
        
        }                                                        
       
        return "redirect:"+referer;
    }
    
}
