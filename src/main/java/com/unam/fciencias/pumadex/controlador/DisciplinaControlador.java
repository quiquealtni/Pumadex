package com.unam.fciencias.pumadex.controlador;

import javax.servlet.http.HttpServletRequest;

import com.unam.fciencias.pumadex.modelo.Disciplina;
import com.unam.fciencias.pumadex.repositorio.DisciplinaRepositorio;
import com.unam.fciencias.pumadex.repositorio.UsuarioRepositorio;
import com.unam.fciencias.pumadex.servicio.DisciplinaServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/disciplina")
public class DisciplinaControlador {
    
    @Autowired
    private DisciplinaServicio disciplinaServicio;
    @Autowired
    private DisciplinaRepositorio disciplinaRepositorio;
    @Autowired
    private UsuarioRepositorio usuarioRepositorio;

    @PostMapping("/agrega")
    public String agrega(HttpServletRequest request, Model model, RedirectAttributes redirectAttrs){
        
        String nombre = request.getParameter("nombre");
        String referer = request.getHeader("Referer");
        if(disciplinaRepositorio.existsDisciplinaByNombre(nombre)){
            redirectAttrs.addFlashAttribute("error", true);
            redirectAttrs.addFlashAttribute("nombreDisciplina", nombre);
        }else{
            Disciplina disciplina = disciplinaServicio.agregaDisciplina(nombre);
            model.addAttribute("disciplina", disciplina);
            redirectAttrs.addFlashAttribute("success", true);
            redirectAttrs.addFlashAttribute("action", "agregada");
        }
        return "redirect:"+referer;
    }
    
    @PostMapping("/edita")
    public String edita(HttpServletRequest request, Model model, RedirectAttributes redirectAttrs){
        String nombre = request.getParameter("nombre");
        Integer id = Integer.parseInt(request.getParameter("id"));
        String referer = request.getHeader("Referer");
        if(!nombre.equals(disciplinaRepositorio.findByIdDisciplina(id).getNombre()) && disciplinaRepositorio.existsDisciplinaByNombre(nombre)){
            redirectAttrs.addFlashAttribute("error", true);
            redirectAttrs.addFlashAttribute("nombreDisciplina", nombre);
        }else{
            disciplinaServicio.actualizaDisciplina(id,nombre);
            redirectAttrs.addFlashAttribute("success", true);
            redirectAttrs.addFlashAttribute("action", "actualizada");   
        }
        return "redirect:"+referer;
    }

    @RequestMapping("/todas")
    public String vistaDisciplinas(Model model) {
        model.addAttribute("disciplinas",disciplinaRepositorio.findAll());
        return "vista-disciplinas";
    }

    @RequestMapping(value="/elimina", method = RequestMethod.GET)
    public String elimina(HttpServletRequest request, Model model, @RequestParam(name="idDisciplina") Integer id, RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
        if(usuarioRepositorio.countUsuariosByDisciplina(id.toString())>0){
            redirectAttrs.addFlashAttribute("errorExists", true);
            return "redirect:"+referer;
        }
        disciplinaRepositorio.deleteById(id);
        redirectAttrs.addFlashAttribute("success", true);
        redirectAttrs.addFlashAttribute("action", "eliminada");
        return "redirect:"+referer;
    }
}
