package com.unam.fciencias.pumadex.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PosicionDto {

    private String nombre;
    private String disciplina;
    private Long puntuacion;
}
