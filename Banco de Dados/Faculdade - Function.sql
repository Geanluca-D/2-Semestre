-- FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 1: Crie uma função chamada idade_estudante que receba a data denascimento de um estudante e retorne à idade. -------------------------------------------------
DELIMITER $$
CREATE FUNCTION idade_estudante(p_data_nascimento DATE)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE idade INT;
    SELECT TIMESTAMPDIFF(YEAR, data_nascimento, NOW()) INTO idade FROM tb_estudantes WHERE data_nascimento = p_data_nascimento;
	RETURN idade;
END$$
DELIMITER ;

SELECT idade_estudante('2005-01-28');
SELECT * FROM tb_estudantes;

-- Exercício 2: Crie uma função chamada total_estudantes_disciplina que receba o ID de uma disciplina e retorne o número de estudantes matriculados nela. -----------------
DELIMITER $$
CREATE FUNCTION total_estudantes_disciplina(p_id_disciplina INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE totalEstudantes INT;
    SELECT COUNT(id_estudante) INTO totalEstudantes FROM tb_matriculas WHERE id_disciplina = p_id_disciplina;
	RETURN totalEstudantes;
END$$
DELIMITER ;

SELECT total_estudantes_disciplina('3');
SELECT * FROM tb_matriculas;

-- Exercício 3: Crie uma função chamada nota_maxima que retorne a maior nota registrada na tabela notas. ------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION nota_maxima()
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
	DECLARE notaMax DECIMAL(10,2);
    SELECT max(nota) INTO notaMax FROM tb_notas;
	RETURN notaMax;
END$$
DELIMITER ;

SELECT nota_maxima();
SELECT * FROM tb_notas;

-- Exercício 4: Crie uma função chamada disciplina_do_curso que receba o ID de um curso e retorne o nome da disciplina associada. -----------------------------------------
DELIMITER $$
CREATE FUNCTION disciplina_do_curso(p_id_curso INT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
	DECLARE disciplinas VARCHAR(255);
    SELECT nome INTO disciplinas FROM tb_disciplinas WHERE id_curso = p_id_curso limit 1;
    RETURN disciplinas;
END$$
DELIMITER ;

SELECT disciplina_do_curso('2');
SELECT * FROM tb_disciplinas;

-- Exercício 5: Crie uma função chamada media_notas_curso que receba o ID de um curso e retorne a média das notas dos estudantes matriculados nesse curso. ----------------
DELIMITER $$
CREATE FUNCTION media_notas_curso(p_id_curso INT)
RETURNS DECIMAL(5,2)
READS SQL DATA
BEGIN
	DECLARE media DECIMAL(5,2);
    SELECT avg(n.nota) INTO media FROM tb_notas AS n
    INNER JOIN tb_matriculas AS m
    ON n.id_matricula = m.id_matricula
    INNER JOIN tb_estudantes AS e
    ON m.id_estudante = e.id_estudante
    INNER JOIN tb_cursos AS c
    ON e.id_curso = c.id_curso
    WHERE p_id_curso = c.id_curso;
    RETURN media;
END$$
DELIMITER ;

DROP FUNCTION media_notas_curso;
select media_notas_curso('2');

