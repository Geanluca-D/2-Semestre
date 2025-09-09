-- DML ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TB_CURSOS ------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO tb_cursos(nome, duracao_anos) VALUES (
'Ciência de Dados',
'2'
);

INSERT INTO tb_cursos(nome, duracao_anos) VALUES (
'Cyber Segurança',
'2'
);

INSERT INTO tb_cursos(nome, duracao_anos) VALUES (
'Engenharia de Dados',
'4'
);

INSERT INTO tb_cursos(nome, duracao_anos) VALUES (
'Análise e Desenvolvimento de Sistemas',
'2'
);

INSERT INTO tb_cursos(nome, duracao_anos) VALUES (
'Ciência da computação',
'4'
);

-- TB_PROFESSORES -------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO tb_professores(nome, departamento, ano_admissao) VALUES (
'Daniel Silva',
'Ciência de Dados',
'2022-02-01'
);

INSERT INTO tb_professores(nome, departamento, ano_admissao) VALUES (
'Ednaldo Pereira',
'Cyber Seguraça',
'2021-02-01'
);

INSERT INTO tb_professores(nome, departamento, ano_admissao) VALUES (
'Felipe Santos',
'Engenharia de Dados',
'2019-02-01'
);

INSERT INTO tb_professores(nome, departamento, ano_admissao) VALUES (
'Gabriel Bressiani',
'Análise e Desenvolvimento de Sistemas',
'2023-02-01'
);

INSERT INTO tb_professores(nome, departamento, ano_admissao) VALUES (
'Heloisa Almeida',
'Ciência da Computação',
'2018-02-01'
);
-- TB_DISCIPLINAS -------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO tb_disciplinas(nome, id_curso, id_professor) VALUES (
'Gerenciamento de Dados',
'1',
'1'
);

INSERT INTO tb_disciplinas(nome, id_curso, id_professor) VALUES (
'Hacking',
'2',
'2'
);

INSERT INTO tb_disciplinas(nome, id_curso, id_professor) VALUES (
'Machine Learning',
'3',
'3'
);

INSERT INTO tb_disciplinas(nome, id_curso, id_professor) VALUES (
'Lógica de Programação',
'4',
'4'
);

INSERT INTO tb_disciplinas(nome, id_curso, id_professor) VALUES (
'Arquitetura de Sistemas',
'5',
'5'
);
-- TB_ESTUDANTES --------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO tb_estudantes(nome, data_nascimento, email, id_curso, data_matricula) VALUES (
'Geanluca Duarte',
'2005-01-28',
'geanluca@gmail.com',
'1',
'2024-02-01'
);

INSERT INTO tb_estudantes(nome, data_nascimento, email, id_curso, data_matricula) VALUES (
'Rubert Nascimento',
'2004-05-13',
'rubert@gmail.com',
'2',
'2024-07-01'
);

INSERT INTO tb_estudantes(nome, data_nascimento, email, id_curso, data_matricula) VALUES (
'Arthur Berlofa',
'2006-09-18',
'arthur@gmail.com',
'3',
'2023-01-20'
);

INSERT INTO tb_estudantes(nome, data_nascimento, email, id_curso, data_matricula) VALUES (
'Jonas Max',
'2005-12-15',
'jonas@gmail.com',
'4',
'2024-02-01'
);

INSERT INTO tb_estudantes(nome, data_nascimento, email, id_curso, data_matricula) VALUES (
'João Paulo Silva',
'2002-03-14',
'joao@gmail.com',
'5',
'2021-01-25'
);
-- TB_MATRICULAS --------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO tb_matriculas(id_estudante, id_disciplina, data_matricula) VALUES (
'3',
'2',
'2024-02-01'
);

INSERT INTO tb_matriculas(id_estudante, id_disciplina, data_matricula) VALUES (
'2',
'2',
'2024-07-01'
);

INSERT INTO tb_matriculas(id_estudante, id_disciplina, data_matricula) VALUES (
'3',
'3',
'2023-01-20'
);

INSERT INTO tb_matriculas(id_estudante, id_disciplina, data_matricula) VALUES (
'4',
'4',
'2024-02-01'
);

INSERT INTO tb_matriculas(id_estudante, id_disciplina, data_matricula) VALUES (
'5',
'5',
'2021-01-25'
);
-- TB_NOTAS -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO tb_notas(id_matricula, nota, data_lancamento) VALUES (
'1',
'95.5',
'2024-12-15'
);

INSERT INTO tb_notas(id_matricula, nota, data_lancamento) VALUES (
'2',
'78',
'2025-07-15'
);

INSERT INTO tb_notas(id_matricula, nota, data_lancamento) VALUES (
'3',
'97',
'2023-12-20'
);

INSERT INTO tb_notas(id_matricula, nota, data_lancamento) VALUES (
'4',
'88',
'2024-12-10'
);

INSERT INTO tb_notas(id_matricula, nota, data_lancamento) VALUES (
'5',
'63',
'2022-12-18'
);