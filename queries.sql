
--Ejercicio 1 - Tabla creada en en el archivo database.sql
 
--Ejercicio 2 
INSERT INTO perro (id_perro, nombre, fecha_nac, sexo, dni_dueno) 
VALUES (10, 'Fito', '2022-08-14', 'M', 35502665 )

INSERT INTO dueno (dni, nombre, apellido, telefono, direccion) 
VALUES (35502665, 'Fernando', 'Tadeo', 3541222719, 'Bv. Los Andes 2224',  )


--Ejercicio 8

INSERT INTO historial (id_historial, fecha, perro, descripcion, monto)
values (10, '2022-08-14', 'Fito', 'Caniche adulto de 5k', 150 )