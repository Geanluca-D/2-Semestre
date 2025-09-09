-- Realize as seguintes consultas
-- a. O livro com a data de publicação mais antigo
-- b. O livro com a data de publicação mais recente
-- c. A quantidade de livros cadastrados no banco de dados
-- d. Consulte apenas os livros que possuam a data de devolução em 18-04-2024  //  2025-08-04
-- e. Ordene o nome dos autores em ordem crescente
-- f. Ordene o nome dos livros em ordem decrescente

use db_biblioteca;

-- a.
SELECT titulo, ano_publicacao FROM tb_livros ORDER BY ano_publicacao ASC LIMIT 1;

-- b.
SELECT titulo, ano_publicacao FROM tb_livros ORDER BY ano_publicacao DESC LIMIT 1;

-- c.
SELECT count(id_livro) AS 'Total de livros cadastrados' FROM tb_livros;

-- d.
SELECT * FROM tb_emprestimos WHERE data_emprestimo = '2024-04-18'; -- Data que possui empréstimo: 2025-08-04

-- e.
SELECT nome FROM tb_autores ORDER BY nome ASC;

-- f.
SELECT nome FROM tb_autores ORDER BY nome DESC;