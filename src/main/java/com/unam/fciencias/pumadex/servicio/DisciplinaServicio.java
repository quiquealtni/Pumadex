package com.unam.fciencias.pumadex.servicio;

import com.unam.fciencias.pumadex.modelo.Disciplina;

public interface DisciplinaServicio {

    Disciplina agregaDisciplina(String nombre);
    void actualizaDisciplina(Integer id, String nombre);
    String findNombreDisciplina(String id);
}
