package com.unam.fciencias.pumadex.controlador;

import javax.servlet.http.HttpServletRequest;
import com.unam.fciencias.pumadex.modelo.Usuario;
import com.unam.fciencias.pumadex.repositorio.DisciplinaRepositorio;
import com.unam.fciencias.pumadex.repositorio.UsuarioRepositorio;
import com.unam.fciencias.pumadex.servicio.UsuarioServicio;
import com.unam.fciencias.pumadex.util.Rol;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/juez")
public class JuezControlador {

    @Autowired
    private UsuarioServicio usuarioServicio;
    @Autowired
    private UsuarioRepositorio usuarioRepositorio;
    @Autowired
    private DisciplinaRepositorio disciplinaRepositorio;

    @PostMapping("/agrega")
    public String agrega(HttpServletRequest request, Model model, RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
        String email = request.getParameter("email");
        String rfc = request.getParameter("rfc");
        boolean existeEmail = usuarioRepositorio.existsUsuarioByEmail(email);
        boolean existeRfc = usuarioRepositorio.existsUsuarioByEmail(rfc);
        if(existeEmail||existeRfc){
            redirectAttrs.addFlashAttribute("error", true);
            redirectAttrs.addFlashAttribute("emailJuez",email);
            redirectAttrs.addFlashAttribute("rfcJuez",rfc);
        }else{
            String password = new BCryptPasswordEncoder().encode(request.getParameter("password")); 
            Usuario usuario = usuarioServicio.agregaUsuario(request.getParameter("nombre"), request.getParameter("ap-paterno"), 
                                                        request.getParameter("ap-materno"), request.getParameter("telefono"), 
                                                        email, password, 1, request.getParameter("nombre-disciplina"),
                                                        rfc , null, null, Rol.ROLE_JUEZ);
            model.addAttribute("usuario", usuario);
            redirectAttrs.addFlashAttribute("success", true);
            redirectAttrs.addFlashAttribute("action", "agregado");
        }
        return "redirect:"+referer;
    }


    @PostMapping("/edita")
    public String edita(HttpServletRequest request, Model model, RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
        Integer id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String rfc = request.getParameter("rfc");
        if((!email.equals(usuarioRepositorio.findByIdUsuario(id).getEmail())&& usuarioRepositorio.existsUsuarioByEmail(email))
            || (!rfc.equals(usuarioRepositorio.findByIdUsuario(id).getRfc())&& usuarioRepositorio.existsUsuarioByRfc(rfc))){
            redirectAttrs.addFlashAttribute("error", true);
            redirectAttrs.addFlashAttribute("emailJuez",email);
            redirectAttrs.addFlashAttribute("rfcJuez",rfc);
        }else{
            String password = request.getParameter("passwordE");
            if(password!="")
                password = new BCryptPasswordEncoder().encode(password);
            else
                password = null;     
            usuarioServicio.actualizaUsuario(id,request.getParameter("nombre"), request.getParameter("ap-paterno"), 
                                                        request.getParameter("ap-materno"), request.getParameter("telefono"), 
                                                        email, password, 1, request.getParameter("nombre-disciplina-e"),
                                                        rfc , null);

            redirectAttrs.addFlashAttribute("success", true);
            redirectAttrs.addFlashAttribute("action", "actualizado"); 
        }
        return "redirect:"+referer;
    }

    @RequestMapping("/todos")
    public String vistaJueces(Model model) {
        model.addAttribute("jueces",usuarioRepositorio.findAllByRol(Rol.ROLE_JUEZ.toString()));
        model.addAttribute("disciplinas",disciplinaRepositorio.findAll());
        return "vista-jueces";
    }

    @RequestMapping(value="/elimina", method = RequestMethod.GET)
    public String elimina(HttpServletRequest request, Model model, @RequestParam(name="idUsuario") Integer id, RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
        usuarioRepositorio.deleteById(id);
        redirectAttrs.addFlashAttribute("success", true);
        redirectAttrs.addFlashAttribute("action", "eliminado");
        return "redirect:"+referer;
    }
    
}
