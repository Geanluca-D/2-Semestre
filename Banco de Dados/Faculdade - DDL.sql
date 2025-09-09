-- DDL ------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE DATABASE db_faculdade;
USE db_faculdade;

CREATE TABLE tb_cursos(
id_curso INT(3) NOT NULL UNIQUE AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
duracao_anos INT(2) NOT NULL,
PRIMARY KEY(id_curso)
);

CREATE TABLE tb_professores(
id_professor INT(3) NOT NULL UNIQUE AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
departamento VARCHAR(100) NOT NULL,
PRIMARY KEY(id_professor)
);

CREATE TABLE tb_disciplinas(
id_disciplina INT(3) NOT NULL UNIQUE AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
id_curso INT(3) NOT NULL,
id_professor INT(3) NOT NULL,
PRIMARY KEY(id_disciplina),
FOREIGN KEY(id_curso) REFERENCES tb_cursos(id_curso),
FOREIGN KEY(id_professor) REFERENCES tb_professores(id_professor)
);

CREATE TABLE tb_estudantes(
id_estudante INT(3) NOT NULL UNIQUE AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
data_nascimento DATE,
email VARCHAR(100) NOT NULL,
id_curso INT(3) NOT NULL,
data_matricula DATE NOT NULL,
PRIMARY KEY(id_estudante),
FOREIGN KEY(id_curso) REFERENCES tb_cursos(id_curso)
);

CREATE TABLE tb_matriculas(
id_matricula INT(3) NOT NULL UNIQUE AUTO_INCREMENT,
id_estudante INT(3) NOT NULL,
id_disciplina INT(3) NOT NULL,
data_matricula DATE NOT NULL,
PRIMARY KEY(id_matricula),
FOREIGN KEY(id_estudante) REFERENCES tb_estudantes(id_estudante),
FOREIGN KEY(id_disciplina) REFERENCES tb_disciplinas(id_disciplina)
);

CREATE TABLE tb_notas(
id_nota INT(3) NOT NULL UNIQUE AUTO_INCREMENT,
id_matricula INT(3) NOT NULL,
nota DECIMAL(5,2),
data_lancamento DATE,
PRIMARY KEY(id_nota),
FOREIGN KEY(id_matricula) REFERENCES tb_matriculas(id_matricula)
);
