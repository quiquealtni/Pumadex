package com.unam.fciencias.pumadex.servicio.impl;

import com.unam.fciencias.pumadex.modelo.Calificacion;
import com.unam.fciencias.pumadex.repositorio.CalificacionesRepositorio;
import com.unam.fciencias.pumadex.servicio.CalificacionesServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalificacionesServicioImpl implements CalificacionesServicio {

    @Autowired
    private CalificacionesRepositorio calificacionesRepositorio;
    @Override
    public Calificacion registrarCalificacion(Integer idCompetidor, Integer calificacion, String comentario,
            Integer idJuez) {
        
        Calificacion calificacionR = new Calificacion();
        calificacionR.setIdCompetidor(idCompetidor);
        calificacionR.setCalificacion(calificacion);
        calificacionR.setComentario(comentario);
        calificacionR.setIdJuez(idJuez);

        return calificacionesRepositorio.save(calificacionR);
    }
    
}
