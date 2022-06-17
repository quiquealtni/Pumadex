package com.unam.fciencias.pumadex.modelo;

import lombok.Data;

import javax.persistence.*;

@Data
@Table(name = "disciplina")
@Entity
public class Disciplina {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idDisciplina;
    @Column
    private String nombre;

}
