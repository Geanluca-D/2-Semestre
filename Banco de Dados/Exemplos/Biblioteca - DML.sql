USE db_biblioteca;

-- AUTORES -----------------------------------------------------------------------------------------------
INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES(
	'1',
    'Douglas Miranda',
    '1990-04-22'
);
INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES(
	'2',
    'Matheus Menegueli',
    '1950-05-02'
);
INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES(
	'3',
    'Guilherme Almeida',
    '2004-08-29'
);
INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES(
	'4',
    'Caick Romero',
    '1979-07-15'
);
INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES(
	'5',
    'Gabriel Hideki',
    '1982-11-04'
);

-- LIVROS ------------------------------------------------------------------------------------------------------------
INSERT INTO tb_livros(id_livro, titulo, ano_publicacao, id_autorL) VALUES(
	'1',
    'A filosofia da montanha',
    '2022',
    '1'
);
INSERT INTO tb_livros(id_livro, titulo, ano_publicacao, id_autorL) VALUES(
	'2',
    'Ideais contra o tempo',
    '1995',
    '2'
);
INSERT INTO tb_livros(id_livro, titulo, ano_publicacao, id_autorL) VALUES(
	'3',
    'Como encontra a gnose',
    '2020',
    '3'
);
INSERT INTO tb_livros(id_livro, titulo, ano_publicacao, id_autorL) VALUES(
	'4',
    'Basquete para a vida',
    '2005',
    '4'
);
INSERT INTO tb_livros(id_livro, titulo, ano_publicacao, id_autorL) VALUES(
	'5',
    'O caminho do povo nipon',
    '2022',
    '5'
);

-- MEMBROS -------------------------------------------------------------------------------------------------------------------
INSERT INTO tb_membros(id_membro, nome, data_adesao) VALUES(
	'1',
    'Jonas Max',
    '2024-02-17'
);
INSERT INTO tb_membros(id_membro, nome, data_adesao) VALUES(
	'2',
    'Arthur Berlofa',
    '2015-04-03'
);
INSERT INTO tb_membros(id_membro, nome, data_adesao) VALUES(
	'3',
    'Carlos Gustavo',
    '2022-06-01'
);
INSERT INTO tb_membros(id_membro, nome, data_adesao) VALUES(
	'4',
    'João Paulo',
    '2018-04-09'
);
INSERT INTO tb_membros(id_membro, nome, data_adesao) VALUES(
	'5',
    'Felipe Maganhato',
    '2010-01-30'
);

-- EMPRESTIMOS ------------------------------------------------------------------------------------------------------------------
INSERT INTO tb_emprestimos(id_emprestimo, id_membro, id_livro, data_emprestimo, data_devolucao) VALUES(
	'1',
    '1',
    '1',
    '2025-08-04',
    '2025-08-14'
);
INSERT INTO tb_emprestimos(id_emprestimo, id_membro, id_livro, data_emprestimo, data_devolucao) VALUES(
	'2',
    '2',
    '3',
    '2020-11-01',
    '2020-11-11'
);
INSERT INTO tb_emprestimos(id_emprestimo, id_membro, id_livro, data_emprestimo, data_devolucao) VALUES(
	'3',
    '3',
    '4',
    '2023-01-04',
    '2023-01-14'
);
INSERT INTO tb_emprestimos(id_emprestimo, id_membro, id_livro, data_emprestimo, data_devolucao) VALUES(
	'4',
    '5',
    '5',
    '2024-08-18',
    '2024-08-28'
);
INSERT INTO tb_emprestimos(id_emprestimo, id_membro, id_livro, data_emprestimo, data_devolucao) VALUES(
	'5',
    '4',
    '2',
    '2019-06-05',
    '2019-06-15'
);

-- UPDATES ---------------------------------------------------------------------------------------------------------
UPDATE tb_autores SET data_nascimento = '2000-04-22' WHERE id_autor = '1';
UPDATE tb_livros SET titulo = 'Caminho Ninpo-brasileiro' WHERE id_livro = '5';
UPDATE tb_membros SET data_adesao = '2021-06-01' WHERE id_membro = '3';
UPDATE tb_emprestimos SET data_emprestimo = '2019-06-06' WHERE id_emprestimo = '5';
UPDATE tb_membros SET nome = 'Arthur Bosi' WHERE id_membro = '2';