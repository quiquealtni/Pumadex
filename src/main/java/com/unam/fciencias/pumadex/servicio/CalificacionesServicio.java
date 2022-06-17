package com.unam.fciencias.pumadex.servicio;

import com.unam.fciencias.pumadex.modelo.Calificacion;

public interface CalificacionesServicio {
    Calificacion registrarCalificacion(Integer idCompetidor, Integer calificacion, String comentario, Integer idJuez);
}
