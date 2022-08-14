-- Pto 9) Escriba una consulta que permita actualizar la dirección de un dueño. 
--        Su nueva dirección es Libertad 123
-- Consulta en sqlfiddle.com

-- CREATE DATABASE peluCanina;
-- USE peluCanina;
CREATE TABLE duenio(
    dni int NOT NULL,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    telefono bigint NOT NULL,
    direccion varchar(50) NOT NULL,
    constraint pk_c primary key (dni)
    );   

CREATE TABLE perro(
    id_perro int AUTO_INCREMENT NOT NULL,
    name varchar(50) NOT NULL,
    fechaNac date NOT NULL,
    sexo enum("hembra","macho") NOT NULL,
    constraint pk_c primary key (id_perro),
    fk_duenio_dni int,
    constraint pk_f foreign key (fk_duenio_dni) references duenio(dni)
);
    
CREATE TABLE historial(
        id_historial int AUTO_INCREMENT NOT NULL,
        fecha date NOT NULL,
        descripcion varchar(150) NOT NULL,
        Monto DECIMAL(16,2) NOT NULL check (monto>=0),
        constraint pk_h primary key (id_historial),
        fk_id_perro int,
        constraint pk_p foreign key (fk_id_perro) references perro(id_perro)
    );

INSERT INTO duenio(dni,nombre,apellido,telefono,direccion)
VALUES  ("37876584", "Pedro", "alvear", "1137874509", "calle 123 Diagonal"),
       ("35860794", "Ana", "Molina", "1148667820","calle 456 Sur"),
       ("28476195", "Maria", "Guitierrez", "1159678931","calle 655 Oeste");
       
INSERT INTO perro(name, fechaNac, sexo, fk_duenio_dni )
VALUES ("Luli", "2020-10-15", "hembra", "37876584"),
	    ("Dora", "2016-12-23", "hembra", "35860794"),
        ("Mora", "2019-11-25", "hembra", "28476195");
        
INSERT INTO historial(fecha, monto,descripcion,fk_id_perro)
VALUES  ( "2021-10-15", 3000, "control", 1),
	    ( "2017-06-08", 500, "control", 2),
        ( "2020-11-25", 2000, "control", 3);


--Consulta, rta pto 9

SELECT*FROM duenio
UPDATE duenio SET direccion="Libertad 123" WHERE (dni = "37876584");