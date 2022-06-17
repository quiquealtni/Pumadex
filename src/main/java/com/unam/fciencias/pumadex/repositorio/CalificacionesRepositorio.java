package com.unam.fciencias.pumadex.repositorio;

import com.unam.fciencias.pumadex.modelo.CalificacionId;
import com.unam.fciencias.pumadex.util.Rol;

import java.util.List;
import java.util.Optional;

import com.unam.fciencias.pumadex.modelo.Calificacion;
import com.unam.fciencias.pumadex.dto.CalificacionDto;
import com.unam.fciencias.pumadex.dto.MiCalificacionDto;
import com.unam.fciencias.pumadex.dto.PosicionDto;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CalificacionesRepositorio extends JpaRepository<Calificacion, CalificacionId>{
    Optional<Calificacion> findById(CalificacionId id);
    
    @Query("select new com.unam.fciencias.pumadex.dto.CalificacionDto(u.idUsuario,u.nombre,u.apPaterno,u.apMaterno,u.disciplina,c.calificacion,c.comentario) from Usuario u LEFT OUTER JOIN Calificacion c ON u.idUsuario = c.idCompetidor AND c.idJuez=?2 WHERE u.disciplina=?1 and u.rol = ?3 and u.status=1")
    List<CalificacionDto> findAll(String disciplina, Integer idJuez, Rol rol);

    @Query("select new com.unam.fciencias.pumadex.dto.MiCalificacionDto(c.calificacion, c.comentario, CONCAT(u.nombre, ' ', u.apPaterno, ' ',u.apMaterno)) from Calificacion c JOIN Usuario u ON c.idJuez = u.idUsuario WHERE c.idCompetidor = ?1 and u.status=1")
    List<MiCalificacionDto> findMisCalificaciones(Integer idCompetidor);

    @Query("select new com.unam.fciencias.pumadex.dto.PosicionDto(CONCAT(u.nombre, ' ', u.apPaterno, ' ', u.apMaterno), u.disciplina, SUM(c.calificacion) as puntuacion) from Usuario u JOIN Calificacion c ON u.idUsuario = c.idCompetidor WHERE u.status= 1 GROUP BY c.idCompetidor ORDER BY puntuacion DESC")
    List<PosicionDto> getPosiciones();
    
}

