package com.unam.fciencias.pumadex.repositorio;

import java.util.List;

import com.unam.fciencias.pumadex.modelo.Disciplina;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DisciplinaRepositorio extends JpaRepository<Disciplina, Integer>{
    
    List<Disciplina> findAll();
    void deleteById(Integer id);
    Disciplina findByIdDisciplina(Integer id);
    boolean existsDisciplinaByNombre(String nombre);
}
