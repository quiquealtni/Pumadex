package com.unam.fciencias.pumadex.servicio.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;

import com.unam.fciencias.pumadex.modelo.Usuario;
import com.unam.fciencias.pumadex.repositorio.UsuarioRepositorio;
import com.unam.fciencias.pumadex.servicio.seguridad.DetalleUsuarioServicio;

@Service
public class DetalleUsuarioServicioImpl implements DetalleUsuarioServicio, UserDetailsService {

    @Autowired
    UsuarioRepositorio usuarioRepositorio;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Usuario usuarioActivo = usuarioRepositorio.findByEmail(email);
        if(usuarioActivo == null){
            throw new UsernameNotFoundException("email not found");
        }
        UserDetails userDetails;
        //GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("ROLE_ADMIN");
        GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(usuarioActivo.getRol().toString());

        userDetails = (UserDetails) new User(usuarioActivo.getEmail(), usuarioActivo.getPassword(), Arrays.asList(grantedAuthority));
        return userDetails;
    }
}