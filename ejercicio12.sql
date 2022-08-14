USE database 
SELECT * FROM perros
WHERE sexo = 'm'
AND fecha_nac BETWEEN '2020-01-01' AND '2022-01-01'