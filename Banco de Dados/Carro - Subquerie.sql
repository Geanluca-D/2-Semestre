-- Subquerie - Carro -----------------------------------------------------------------------------------------
use db_carro;

-- 1. Quais carros tem um preço acima da média
-- 1st calcular a média
SELECT AVG(valor) FROM tb_carro;

-- Resultado:
SELECT * FROM tb_carro WHERE valor > (SELECT AVG(valor) FROM tb_carro);