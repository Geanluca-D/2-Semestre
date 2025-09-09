
-- Criação base de dados 
CREATE DATABASE db_carro;

-- Acesso a base de dados 
USE db_carro;

-- Criação tabela 
CREATE TABLE tb_carro (
id_carro INT(10) NOT NULL,
marca VARCHAR(100),
modelo VARCHAR(100),
ano INT(4),
valor DECIMAL(10,2),
cor VARCHAR(100),
numero_vendas INT(10),
PRIMARY KEY (id_carro)
);

CREATE TABLE tb_proprietario(
id_proprietario INT(10) NOT NULL,
nome VARCHAR(255),
id_carroF INT(10) NOT NULL,
PRIMARY KEY(id_proprietario),
FOREIGN KEY(id_carroF) REFERENCES tb_carro(id_carro)
);

-- Alterar informações
ALTER TABLE tb_proprietario ADD idade INT(3);
-- ALTER TABLE tb_proprietario DROP idade; -- Remove coluna
-- ALTER TABLE tb_proprietario RENAME COLUMN nome TO name; -- Renomeia coluna
-- ALTER TABLE tb_proprietario CHANGE idade FLOAT(10,2);

-- SELECT marca, modelo FROM  tb_carro; ----Exibe marca e modelo da tabela
-- SELECT * FROM tb_proprietario; --Exibe todos os valores da tabela


CREATE TABLE tb_historico (
id_historico INT(10) NOT NULL,
data_modificacao DATE,
id_carro INT(10) NOT NULL,
valor_anterior DECIMAL(10,2),
valor_novo DECIMAL(10,2),
PRIMARY KEY (id_historico),
FOREIGN KEY (id_carro) REFERENCES tb_carro(id_carro)
);

-- Exclui tabela
-- DROP TABLE tb_historico;

-- SELECT * FROM tb_historico;

USE db_carro;

-- SELECT * FROM tb_carro; --Exibe todos os valores da tabela
INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor,cor,numero_vendas) VALUES (
'1',
'Renault',
'Kwid',
'2023',
'80000',
'branco',
'150000'
);

INSERT INTO tb_carro(id_carro, marca, modelo, ano, valor, cor, numero_vendas) VALUES(
'2',
'Honda',
'Civic',
'2022',
'85000',
'prata',
'350000'
);

INSERT INTO tb_carro(id_carro, marca, modelo, ano, valor, cor, numero_vendas) VALUES(
'3',
'Fiat',
'Uno',
'2021',
'70000',
'preto',
'210000'
);

INSERT INTO tb_carro(id_carro, marca, modelo, ano, valor, cor, numero_vendas) VALUES(
'4',
'Chevrolet',
'Onix',
'2023',
'85000',
'azul',
'340000'
);

INSERT INTO tb_carro(id_carro, marca, modelo, ano, valor, cor, numero_vendas) VALUES(
'5',
'Fiat',
'Mobi',
'2022',
'72000',
'branco',
'310000'
);

INSERT INTO tb_carro(id_carro, marca, modelo, ano, valor, cor, numero_vendas) VALUES(
'6',
'Chevrolet',
'Cruze',
'2024',
'95000',
'chumbo',
'220000'
);

-- SELECT * FROM tb_proprietario; -- Exibe todos os valores da tabela
-- ALTER TABLE tb_proprietario drop row; -- Não sei

INSERT INTO tb_proprietario(id_proprietario, nome, id_carroF, idade) VALUES(
'1',
'Jessica',
'1',
'25'
);

INSERT INTO tb_proprietario(id_proprietario, nome, id_carroF, idade) VALUES(
'2',
'Guilherme',
'2',
'25'
);

INSERT INTO tb_proprietario(id_proprietario, nome, id_carroF, idade) VALUES(
'3',
'José',
'3',
'34'
);

INSERT INTO tb_proprietario(id_proprietario, nome, id_carroF, idade) VALUES(
'4',
'Maria',
'4',
'29'
);

INSERT INTO tb_proprietario(id_proprietario, nome, id_carroF, idade) VALUES(
'5',
'João',
'5',
'44'
);

INSERT INTO tb_proprietario(id_proprietario, nome, id_carroF, idade) VALUES(
'6',
'Ana',
'6',
'25'
);

-- Alteração - UPDATE

UPDATE tb_proprietario SET idade = '43' WHERE id_proprietario = '5';

UPDATE tb_carro SET cor = 'verde' WHERE id_carro = '2';
UPDATE tb_proprietario SET nome = 'geanluca' WHERE id_proprietario = '2';
UPDATE tb_carro SET marca = 'Lamborghini', modelo = 'Aventador SVJ', ano = '2018', valor = '8000000', cor = 'branco', numero_vendas = '1' WHERE id_carro = '4';
UPDATE 	tb_carro SET valor = '500' WHERE id_carro = '1';
UPDATE tb_carro SET valor = '2' WHERE id_carro = '5';

-- SELECT * FROM  tb_proprietario;
delete from tb_proprietario where id_proprietario = '6';
-- SELECT * FROM  tb_proprietario;