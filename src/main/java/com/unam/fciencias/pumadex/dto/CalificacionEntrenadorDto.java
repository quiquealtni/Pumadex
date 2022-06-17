package com.unam.fciencias.pumadex.dto;

import java.util.List;

import com.unam.fciencias.pumadex.modelo.Usuario;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CalificacionEntrenadorDto {
    private Usuario usuario;
    private List<MiCalificacionDto> calificaciones;
}
