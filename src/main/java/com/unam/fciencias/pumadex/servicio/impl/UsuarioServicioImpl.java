package com.unam.fciencias.pumadex.servicio.impl;

import com.unam.fciencias.pumadex.modelo.Usuario;
import com.unam.fciencias.pumadex.repositorio.UsuarioRepositorio;
import com.unam.fciencias.pumadex.servicio.UsuarioServicio;
import com.unam.fciencias.pumadex.util.Rol;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServicioImpl implements UsuarioServicio{

    @Autowired
    private UsuarioRepositorio usuarioRepositorio;

    @Override
    public Usuario agregaUsuario(String nombre, String apPaterno, String apMaterno, String telefono, String email,
            String password, Integer status, String disciplina, String rfc, String curp, Integer idEntrenador, Rol rol) {

        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setApPaterno(apPaterno);
        usuario.setApMaterno(apMaterno);
        usuario.setTelefono(telefono);
        usuario.setEmail(email);
        usuario.setPassword(password);
        usuario.setStatus(status);
        usuario.setDisciplina(disciplina);
        usuario.setRfc(rfc);
        usuario.setCurp(curp);
        usuario.setIdEntrenador(idEntrenador);
        usuario.setRol(rol);

        return usuarioRepositorio.save(usuario);
    }

    @Override
    public void actualizaUsuario(Integer id, String nombre, String apPaterno, String apMaterno, String telefono,
            String email, String password, Integer status, String disciplina, String rfc, String curp) {
        Usuario usuario = usuarioRepositorio.findByIdUsuario(id);
        usuario.setNombre(nombre);
        usuario.setApPaterno(apPaterno);
        usuario.setApMaterno(apMaterno);
        usuario.setTelefono(telefono);
        usuario.setEmail(email);
        if(password!=null)
            usuario.setPassword(password);
        usuario.setStatus(status);
        usuario.setDisciplina(disciplina);
        usuario.setRfc(rfc);
        usuario.setCurp(curp);
        usuarioRepositorio.save(usuario);
    }

    @Override
    public void actualizaContraseña(Integer id, String password) {
        Usuario usuario = usuarioRepositorio.findByIdUsuario(id);
        usuario.setPassword(password);
        usuarioRepositorio.save(usuario);
    }

}
