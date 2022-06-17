package com.unam.fciencias.pumadex.modelo;

import java.io.Serializable;
import java.util.Objects;

public class CalificacionId implements Serializable{
    private Integer idCompetidor;
    private Integer idJuez;

    public CalificacionId(){
    }

    public CalificacionId(Integer idCompetidor, Integer idJuez){
        this.idCompetidor = idCompetidor;
        this.idJuez = idJuez;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CalificacionId calificacionId = (CalificacionId) o;
        return idCompetidor.equals(calificacionId.idCompetidor) &&
                idJuez.equals(calificacionId.idJuez);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCompetidor, idJuez);
    }
}
