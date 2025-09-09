USE db_carro;

SELECT * FROM tb_carros;
SELECT modelo, cor FROM tb_carros;
SELECT * FROM tb_carro WHERE cor = 'Preto';
SELECT * FROM tb_carro WHERE modelo = 'Palio';

SELECT min(valor) FROM tb_carro;
SELECT max(ano) FROM tb_carro;
SELECT count(id_carro) FROM tb_carro;
SELECT sum(valor) FROM tb_carro;
SELECT * FROM tb_carro ORDER BY modelo ASC;
SELECT * FROM tb_carro ORDER BY marca DESC;

-- Informar a quantidade de registros por marca e que está entre um periodo de tempo

SELECT count(id_carro) AS 'Total Registros', marca FROM tb_carro WHERE ano BETWEEN 2015 AND 2025 GROUP BY marca;

-- Informa a quantidade de registros por marca e que se refere a um ano exato

SELECT count(id_carro) AS 'Registros em 2018', marca FROM  tb_carro WHERE ano = 2018 GROUP BY marca;

