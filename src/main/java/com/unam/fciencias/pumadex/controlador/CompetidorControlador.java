package com.unam.fciencias.pumadex.controlador;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;

import com.unam.fciencias.pumadex.dto.CalificacionEntrenadorDto;
import com.unam.fciencias.pumadex.dto.MiCalificacionDto;
import com.unam.fciencias.pumadex.modelo.Usuario;
import com.unam.fciencias.pumadex.repositorio.CalificacionesRepositorio;
import com.unam.fciencias.pumadex.repositorio.DisciplinaRepositorio;
import com.unam.fciencias.pumadex.repositorio.UsuarioRepositorio;
import com.unam.fciencias.pumadex.servicio.CalificacionesServicio;
import com.unam.fciencias.pumadex.servicio.UsuarioServicio;
import com.unam.fciencias.pumadex.util.Rol;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/competidor")
public class CompetidorControlador {

    @Autowired
    private UsuarioServicio usuarioServicio;
    @Autowired
    private UsuarioRepositorio usuarioRepositorio;
    @Autowired
    private DisciplinaRepositorio disciplinaRepositorio;

    @Autowired
    private CalificacionesServicio calificacionesServicio;
    @Autowired
    private CalificacionesRepositorio calificacionesRepositorio;
    

    //final String currentEmail = SecurityContextHolder.getContext().getAuthentication().getName();
    

    @PostMapping("/agrega")
    public String agrega(HttpServletRequest request, Model model, RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
        String email = request.getParameter("email");
        String curp = request.getParameter("curp");
        boolean existeEmail = usuarioRepositorio.existsUsuarioByEmail(email);
        boolean existeCurp = usuarioRepositorio.existsUsuarioByEmail(curp);
        if(existeEmail||existeCurp){
            redirectAttrs.addFlashAttribute("error", true);
            redirectAttrs.addFlashAttribute("emailCompetidor",email);
            redirectAttrs.addFlashAttribute("curpCompetidor",curp);
        }else{

            String password = new BCryptPasswordEncoder().encode(request.getParameter("password")); 
            Usuario usuario = usuarioServicio.agregaUsuario(request.getParameter("nombre"), request.getParameter("ap-paterno"), 
                                                        request.getParameter("ap-materno"), request.getParameter("telefono"), 
                                                        email, password, 1, request.getParameter("nombre-disciplina"),
                                                        null , curp, currentUser().getIdUsuario(),Rol.ROLE_COMPETIDOR);
            model.addAttribute("usuario", usuario);
            redirectAttrs.addFlashAttribute("success", true);
            redirectAttrs.addFlashAttribute("action", "agregado");
        
        }                                                        
       
        return "redirect:"+referer;
    }   

    @PostMapping("/calificar")
    public String calificar(HttpServletRequest request, Model model, RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
       
        Integer idCompetidor = Integer.parseInt(request.getParameter("idCompetidor"));
        Integer calificacion = Integer.parseInt(request.getParameter("calificacionOtorgada"));
        String comentario = request.getParameter("comentarioJuez");    
        Integer idJuez = currentUser().getIdUsuario();

        calificacionesServicio.registrarCalificacion(idCompetidor, calificacion, comentario, idJuez);
        redirectAttrs.addFlashAttribute("success", true);
        redirectAttrs.addFlashAttribute("action", "calificado");
        return "redirect:"+referer;   
    }

    @RequestMapping("/miscalificaciones")
    public String verCalificaciones(HttpServletRequest request, Model model){
        Integer idCompetidor = currentUser().getIdUsuario();
        model.addAttribute("calificaciones", calificacionesRepositorio.findMisCalificaciones(idCompetidor));
        return "vista-calificaciones-competidor";
    }
    @RequestMapping(value="/calificacionDetalle", method = RequestMethod.GET)
    public String calificacionDetalle(Model model, @RequestParam(name="idCompetidor") Integer id){
       
        Usuario competidor = usuarioRepositorio.findByIdUsuario(id);
        if(competidor == null||competidor.getStatus()==0||currentUser().getIdUsuario()!=competidor.getIdEntrenador()){
            return "403";
        }
        String nombre = competidor.getNombre() + ' ' + competidor.getApPaterno() + ' ' + competidor.getApMaterno();
        model.addAttribute("competidorNombre", nombre);
        model.addAttribute("calificaciones", calificacionesRepositorio.findMisCalificaciones(id));

        return "vista-calificaciones-competidor";

    }
    @RequestMapping("/calificacionesEntrenador")
    public String calificacionesEntrenador(Model model){
        model.addAttribute("competidores",getCalificacionesCompetidores());
        return "vista-calificaciones-entrenador";
    }

    public List<CalificacionEntrenadorDto> getCalificacionesCompetidores(){
        Integer idEntrenador = currentUser().getIdUsuario();
        List<CalificacionEntrenadorDto> calificaciones = new LinkedList<>();
        List<Usuario> competidores = usuarioRepositorio.findAllByIdEntrenador(idEntrenador);
        for (Usuario usuario : competidores) {
            List<MiCalificacionDto> c = calificacionesRepositorio.findMisCalificaciones(usuario.getIdUsuario());
            calificaciones.add(new CalificacionEntrenadorDto(usuario,c));
        }
        return calificaciones;
    }

    @PostMapping("/edita")
    public String edita(HttpServletRequest request, Model model, RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
        Integer id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String curp = request.getParameter("curp");
        if((!email.equals(usuarioRepositorio.findByIdUsuario(id).getEmail())&& usuarioRepositorio.existsUsuarioByEmail(email))
            || (!curp.equals(usuarioRepositorio.findByIdUsuario(id).getCurp())&& usuarioRepositorio.existsUsuarioByCurp(curp))){
            redirectAttrs.addFlashAttribute("error", true);
            redirectAttrs.addFlashAttribute("emailCompetidor",email);
            redirectAttrs.addFlashAttribute("curpCompetidor",curp);
        }else{
            String password = request.getParameter("passwordE");
            if(password!="")
                password = new BCryptPasswordEncoder().encode(password);
            else
                password = null; 
            usuarioServicio.actualizaUsuario(id,request.getParameter("nombre"), request.getParameter("ap-paterno"), 
                                                        request.getParameter("ap-materno"), request.getParameter("telefono"), 
                                                        email, password, 1, request.getParameter("nombre-disciplina-e"),
                                                        null , curp);

            redirectAttrs.addFlashAttribute("success", true);
            redirectAttrs.addFlashAttribute("action", "actualizado"); 
        }
        return "redirect:"+referer;
    }


    @RequestMapping("/todos")
    public String vistaCompetidores(Model model) {
        String disciplina = usuarioRepositorio.findByEmail(currentEmail()).getDisciplina();
        model.addAttribute("competidores",usuarioRepositorio.findAllByRolAndDisciplina(Rol.ROLE_COMPETIDOR.toString(),disciplina));        
        model.addAttribute("disciplinas",disciplinaRepositorio.findAll());
        model.addAttribute("disciplinaEntrenador",disciplina);
        return "vista-competidores";
    }

    @RequestMapping("/calificaciones")
    public String vistaCalificacionesCompetidores(Model model) {
        String disciplina = currentUser().getDisciplina();
        int[] rango = IntStream.range(0, 11).toArray();   
        Integer idJuez = currentUser().getIdUsuario();
        model.addAttribute("competidores",calificacionesRepositorio.findAll(disciplina,idJuez,Rol.ROLE_COMPETIDOR));        

        model.addAttribute("rangoCalificaciones",rango);
        model.addAttribute("disciplinaJuez",disciplina);
        return "vista-calificaciones-competidores";
    }

    @RequestMapping(value="/elimina", method = RequestMethod.GET)
    public String elimina(HttpServletRequest request, Model model, @RequestParam(name="idUsuario") Integer id, RedirectAttributes redirectAttrs){
        String referer = request.getHeader("Referer");
        Usuario competidor = usuarioRepositorio.findByIdUsuario(id);
        if(competidor==null||competidor.getStatus()==0||competidor.getRol()!=Rol.ROLE_COMPETIDOR||!competidor.getDisciplina().equals(currentUser().getDisciplina())){
            return "403";
        }
        usuarioRepositorio.deleteById(id);
        redirectAttrs.addFlashAttribute("success", true);
        redirectAttrs.addFlashAttribute("action", "eliminado");
        return "redirect:"+referer;
    }

    public String currentEmail(){
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

    public Usuario currentUser(){
        return usuarioRepositorio.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
    }
    
}
