package com.unam.fciencias.pumadex.repositorio;

import java.util.List;

import com.unam.fciencias.pumadex.modelo.Usuario;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface UsuarioRepositorio extends JpaRepository<Usuario, Integer>{
    boolean existsUsuarioByEmail(String email);
    boolean existsUsuarioByRfc(String rfc);
    boolean existsUsuarioByCurp(String curp);
    Usuario findByEmail(String email); 
    @Query(value="Select u.* from usuario u where u.rol=?1 and u.status=1",nativeQuery = true)
    List<Usuario> findAllByRol(String rol);
    @Modifying
    @Transactional
    @Query(value="update usuario u set u.status=0 where u.id_usuario=?1",nativeQuery = true)
    void deleteById(Integer id);
    Usuario findByIdUsuario(Integer id);
    @Query(value="Select u.* from usuario u where u.rol=?1 and u.disciplina= ?2 and u.status=1",nativeQuery = true)
    List<Usuario> findAllByRolAndDisciplina(String rol,String disciplina);
    @Query(value="Select u.* from usuario u where u.id_entrenador=?1 and u.status=1",nativeQuery = true)
    List<Usuario> findAllByIdEntrenador(Integer idEntrenador);
    @Query(value="Select count(*) from usuario u where u.disciplina=?1 and u.status=1",nativeQuery = true)
    Integer countUsuariosByDisciplina(String id);
}
