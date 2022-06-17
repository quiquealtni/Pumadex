package com.unam.fciencias.pumadex.servicio.impl;

import com.unam.fciencias.pumadex.modelo.Disciplina;
import com.unam.fciencias.pumadex.repositorio.DisciplinaRepositorio;
import com.unam.fciencias.pumadex.servicio.DisciplinaServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DisciplinaServicioImpl implements DisciplinaServicio{

    @Autowired
    private DisciplinaRepositorio disciplinaRepositorio;

    @Override
    public Disciplina agregaDisciplina(String nombre) {

        Disciplina disciplina = new Disciplina();
        disciplina.setNombre(nombre);

        return disciplinaRepositorio.save(disciplina);
    }

    @Override
    public void actualizaDisciplina(Integer id, String nombre) {
        
        Disciplina disciplina = disciplinaRepositorio.findByIdDisciplina(id);
        disciplina.setNombre(nombre);
        disciplinaRepositorio.save(disciplina);
        
    }

    @Override
    public String findNombreDisciplina(String id) {
        // TODO Auto-generated method stub
        return disciplinaRepositorio.findByIdDisciplina(Integer.parseInt(id)).getNombre();
    }
    
}
