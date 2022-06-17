package com.unam.fciencias.pumadex.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CalificacionDto{
    private Integer idUsuario;
    private String nombre;
    private String apPaterno;
    private String apMaterno;
    private String disciplina;
    private Integer calificacion;
    private String comentario;
}
