package com.unam.fciencias.pumadex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication
//(exclude = { SecurityAutoConfiguration.class })
public class PumadexApplication {

	public static void main(String[] args) {
		SpringApplication.run(PumadexApplication.class, args);
	}

}
