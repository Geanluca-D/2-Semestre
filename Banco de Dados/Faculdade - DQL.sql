-- DQL ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 1: Liste todos os estudantes cadastrados na tabela estudantes que pertencem ao curso de Ciência de Dados e foram matriculados em 2024. ---------------------
SELECT e.nome AS 'Estudante', c.nome AS 'Curso', e.data_matricula FROM tb_estudantes AS e
INNER JOIN tb_cursos AS c
ON e.id_curso = c.id_curso
WHERE c.nome = 'Ciência de Dados';

-- Exercício 2: Liste todos os professores que pertencem ao departamento de Ciência da Computação e possuem mais de 5 anos de experiência. ------------------------------
SELECT * FROM tb_professores WHERE departamento = 'Ciência da Computação' AND TIMESTAMPDIFF(year, ano_admissao, now()) > 5;

-- Exercício 3: Liste os nomes dos estudantes e suas notas nas disciplinas, ---------------------------------------------------------------------------------------------
-- ordenados pela nota em ordem decrescente e, em caso de empate, pelo nome do estudante em ordem alfabética. -----------------------------------------------------------
SELECT e.nome AS 'Estudante', n.nota FROM tb_matriculas AS m
INNER JOIN tb_notas AS n
ON m.id_matricula = n.id_matricula
INNER JOIN tb_estudantes AS e
ON e.id_estudante = m.id_matricula
ORDER BY n.nota DESC, e.nome ASC;

-- Exercício 4: Encontre a média das notas dos estudantes no curso de Engenharia de Software.----------------------------------------------------------------------------
SELECT AVG(n.nota) AS 'Média' FROM tb_notas AS n
INNER JOIN tb_matriculas AS m
ON n.id_matricula = m.id_matricula
INNER JOIN tb_estudantes AS e
ON m.id_estudante = e.id_estudante
INNER JOIN tb_cursos AS c
ON e.id_curso = c.id_curso
WHERE c.nome = 'Engenharia de Dados';

-- Exercício 5: Liste os cursos que possuem mais de 5 estudantes matriculados. Exiba o nome do curso e o total de estudantes matriculados. ------------------------------
SELECT c.nome AS 'Curso', COUNT(e.id_curso) AS 'Total de alunos' FROM tb_cursos AS c
INNER JOIN tb_estudantes AS e
ON c.id_curso = e.id_curso
GROUP BY c.id_curso, c.nome HAVING COUNT(e.id_curso) > 5;

-- SUBQUERIES -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 1: Liste os cursos que possuem mais de 5 disciplinas associadas. -------------------------------------------------------------------------------------------
SELECT * FROM tb_cursos WHERE id_curso IN (SELECT COUNT(id_curso) FROM tb_disciplinas GROUP BY id_curso) > 5;

-- Exercício 2: Liste os estudantes que estão matriculados em mais disciplinas do que a média de disciplinas por estudante. ---------------------------------------------
SELECT e.nome FROM tb_estudantes AS e
WHERE  (SELECT COUNT(*) FROM tb_matriculas AS m WHERE m.id_estudante = e.id_estudante) > 
(SELECT AVG(disciplinas_por_estudante) FROM (SELECT COUNT(*) AS disciplinas_por_estudante FROM tb_matriculas GROUP BY id_estudante) AS disciplinas_por_estudante);

-- Exercício 3: Encontre os professores que ministram disciplinas com a maior média de notas. ---------------------------------------------------------------------------
SELECT * FROM tb_professores AS p
INNER JOIN tb_disciplinas AS d
ON d.id_professor = p.id_professor
INNER JOIN tb_matriculas AS m
ON m.id_disciplina = d.id_disciplina
INNER JOIN tb_notas AS n
ON m.id_matricula = n.id_matricula
WHERE n.nota > (SELECT AVG(nota) FROM tb_notas);

-- Exercício 4: Liste os estudantes que possuem pelo menos uma nota abaixo da média geral de notas. ---------------------------------------------------------------------
SELECT e.nome , n.nota , d.nome FROM tb_estudantes AS e
INNER JOIN tb_matriculas AS m
ON e.id_estudante = m.id_estudante
INNER JOIN tb_notas AS n
ON m.id_matricula = n.id_matricula
INNER JOIN tb_disciplinas AS d
ON d.id_curso = e.id_curso
WHERE nota < (SELECT AVG(nota) FROM tb_notas);

-- Exercício 5: Liste os professores que não possuem nenhuma disciplina com notas abaixo de 7. --------------------------------------------------------------------------

