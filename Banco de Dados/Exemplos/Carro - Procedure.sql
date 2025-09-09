use db_carro;
select * from tb_carro;
-- STORED PROCEDURE ------------------------------------------------------
-- Quando há a necessidade de armazenar um bloco de código que pode envolver multiplas operações (INSERT, UPDATE, DELETE)

-- Cria um procedure que inseira um novo carro na tabela

-- IN -> Parâmetro de entrada
-- Out -> Parâmetro de saída
DELIMITER $$
CREATE PROCEDURE inserir_Carro(
IN p_id_carro INT,
IN p_marca VARCHAR(100),
IN p_modelo VARCHAR(100),
IN p_ano INT,
IN p_valor DECIMAL(10, 2),
IN p_cor VARCHAR(100),
IN p_numero_vendas INT
)
BEGIN
	INSERT INTO tb_carro(id_carro, marca, modelo, ano, valor, cor, numero_vendas)
    VALUES(p_id_carro, p_marca, p_modelo, p_ano, p_valor, p_cor, p_numero_vendas);
END$$
DELIMITER ;

CALL inserir_Carro('9', 'BMW', 'M3', '2024', '150000', 'azul', '30000');