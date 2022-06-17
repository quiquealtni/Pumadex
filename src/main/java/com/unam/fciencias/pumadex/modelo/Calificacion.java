package com.unam.fciencias.pumadex.modelo;

import lombok.Data;

import java.io.Serializable;

import javax.persistence.*;


@Data
@Entity
@Table(name = "calificaciones")
@IdClass(CalificacionId.class)
public class Calificacion implements Serializable{
    @Id
    private Integer idCompetidor;
    @Column
    private Integer calificacion;
    @Column
    private String comentario;
    @Id
    private Integer idJuez;    
}
