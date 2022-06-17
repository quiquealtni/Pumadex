package com.unam.fciencias.pumadex.servicio;

public interface EnviaEmailServicio {
    void sendEmail(String to, String subject, String content);
}
