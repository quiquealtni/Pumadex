package com.unam.fciencias.pumadex.modelo;

import lombok.Data;

import javax.persistence.*;

import com.unam.fciencias.pumadex.util.Rol;

@Data
@Table(name = "usuario")
@Entity
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "idusuario")
    private Integer idUsuario;
    @Column
    private String nombre;
    @Column
    private String apPaterno;
    @Column
    private String apMaterno;
    @Column
    private String telefono;
    @Column
    private String email;
    @Column
    private String password;
    @Column
    private Integer status;
    @Column
    private String disciplina;
    @Column
    private String rfc;
    @Column
    private String curp;
    @Column
    private Integer idEntrenador;
    @Column
    @Enumerated(EnumType.STRING)
    private Rol rol;        
}
