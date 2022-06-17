package com.unam.fciencias.pumadex;

import com.unam.fciencias.pumadex.servicio.seguridad.DetalleUsuarioServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SeguridadConfiguracion extends WebSecurityConfigurerAdapter {

    @Autowired
    private DetalleUsuarioServicio detalleUsuarioServicio;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable().authorizeRequests()
                .antMatchers("/","/registro/**").permitAll()
                .antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/assets/**","/vendor/**","/fonts/**").permitAll()
                .antMatchers("/juez/**","/entrenador/**","/disciplina/**").hasRole("ADMIN")
                .antMatchers("/competidor/calificaciones","/competidor/calificar").hasRole("JUEZ")
                .antMatchers("/competidor/miscalificaciones").hasRole("COMPETIDOR")
                .antMatchers("/competidor/**").hasRole("ENTRENADOR")
                .anyRequest().authenticated()
                .and()
                .formLogin().loginPage("/")
                .loginProcessingUrl("/").usernameParameter("email").passwordParameter("password")
                .defaultSuccessUrl("/home").permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/403")
                .and()
                .logout()// logout configuration
                .logoutUrl("/salir")
                .deleteCookies("JSESSIONID")
                .invalidateHttpSession(true)
                .logoutSuccessUrl("/").permitAll();
    }
    
    /**
    @Override
    public void configure(WebSecurity web) throws Exception {
            web.ignoring().antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/assets/**","/vendor/**","/fonts/**");
    }*/
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        auth.userDetailsService((UserDetailsService) detalleUsuarioServicio).passwordEncoder(passwordEncoder);
    }
}