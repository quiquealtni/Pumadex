DROP TABLE IF EXISTS juez;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS disciplina;


CREATE TABLE usuario(
	id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ap_paterno VARCHAR(100) NOT NULL,
    ap_materno VARCHAR(100) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    status TINYINT NOT NULL,
	disciplina VARCHAR(100),
    rfc VARCHAR(13) UNIQUE,
    curp VARCHAR(18) UNIQUE,
    rol VARCHAR(50),
    PRIMARY KEY(id_usuario)
);

CREATE TABLE disciplina(
	id_disciplina INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    PRIMARY KEY(id_disciplina)
);

INSERT INTO usuario(nombre,ap_paterno,ap_materno,telefono,email,password,status,disciplina,rfc,curp,rol) VALUES('Luis Enrique','Altamirano','Niño','5524363706','quiquealtni@ciencias.unam.mx','$2a$12$0DXXqwK6C2vAT4eUkiNTf.nKisrF5zB.i9U.TegMnOAGHmxejCZU.',1,null,'AANL9906027L6',null,'ROLE_ADMIN');
INSERT INTO usuario(nombre,ap_paterno,ap_materno,telefono,email,password,status,disciplina,rfc,curp,rol) VALUES('Jazmin','García','Gómez','5512345678','miinjeje@gmail.com','$2a$12$YQrirekcT36u/U2cR5Arv.Zq7RQp6uGohJUdobKA1Mmk0F.wgJDgW',1,null,'GAGJ990807DI3',null,'ROLE_ADMIN');
INSERT INTO usuario(nombre,ap_paterno,ap_materno,telefono,email,password,status,disciplina,rfc,curp,rol) VALUES('Erick Eduardo','Luna','Piña','5512345678','gutierritos69kakaroto@skynet.hotmail.yahoo.com','$2a$12$svyJhU7ggYAOr..8vQ75Kut.lLwqZGrXNEnJgU1YapS//E6oIXzHm',1,null,'LUPE98050254A',null,'ROLE_ADMIN');
INSERT INTO usuario(nombre,ap_paterno,ap_materno,telefono,email,password,status,disciplina,rfc,curp,rol) VALUES('Enrique Eduardo','Alcántara','Arce','5512345678','e@gmail.com','$2a$12$4/ZNaaYu1QCwpWEMWQJuS.z1zIrriIlLnRs88gP0f9K7LfrTNV.FG',1,null,'AAAE990610IM0',null,'ROLE_ADMIN');


INSERT INTO usuario(nombre,ap_paterno,ap_materno,telefono,email,password,status,disciplina,rfc,curp,rol) VALUES('Raul','García','Piña','5544332211','coach@pumadex.unam.mx','$2a$12$L.hom85p7geElSAzwvjDbu6q3WxqQD/Q6EMNaOHNSdAseoRH/f.2m',1,'natacion','GAPR8509192V6',null,'ROLE_ENTRENADOR');

INSERT INTO disciplina(nombre) VALUES('Quidditch');
INSERT INTO disciplina(nombre) VALUES('Tenis');
INSERT INTO disciplina(nombre) VALUES('Fútbol Americano');
INSERT INTO disciplina(nombre) VALUES('Ajedrez');
INSERT INTO disciplina(nombre) VALUES('Arquería');
INSERT INTO disciplina(nombre) VALUES('Escalada');
INSERT INTO disciplina(nombre) VALUES('Fútbol Soccer');
INSERT INTO disciplina(nombre) VALUES('Sumo');
INSERT INTO disciplina(nombre) VALUES('Esgrima');
INSERT INTO disciplina(nombre) VALUES('Ciclismo');
INSERT INTO disciplina(nombre) VALUES('Golf');
INSERT INTO disciplina(nombre) VALUES('Ping-pong');

ALTER TABLE usuario ADD COLUMN id_entrenador INT AFTER curp;

DROP TABLE IF EXISTS calificaciones;

CREATE TABLE calificaciones(
	id_competidor INT NOT NULL,
    calificacion INT NOT NULL,
    comentario VARCHAR(300) NOT NULL,
    id_juez INT NOT NULL,
    FOREIGN KEY (id_competidor) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_juez) REFERENCES usuario(id_usuario),
    PRIMARY KEY(id_competidor,id_juez)
);