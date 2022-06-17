package com.unam.fciencias.pumadex.servicio;

import com.unam.fciencias.pumadex.modelo.Usuario;
import com.unam.fciencias.pumadex.util.Rol;

public interface UsuarioServicio {
    Usuario agregaUsuario(String nombre, String apPaterno, String apMaterno, String telefono, String email, String password, Integer status, String disciplina, String rfc, String curp,Integer idEntrenador, Rol rol);
    void actualizaUsuario(Integer id, String nombre, String apPaterno, String apMaterno, String telefono, String email, String password, Integer status, String disciplina, String rfc, String curp);
    void actualizaContraseña(Integer id, String password);
}
