package com.unam.fciencias.pumadex.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MiCalificacionDto {
    private Integer calificacion;
    private String comentario;
    private String nombre;
}
