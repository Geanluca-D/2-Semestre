use db_biblioteca;

-- INNER JOIN ---------------------------------------------------------------------------------------------
-- 1. Liste o título do livro e o nome do autor.
select l.titulo, a.nome as 'nome do autor' from tb_livros as l
inner join tb_autores as a
on l.id_autorL = a.id_autor;

-- 2. Liste o título do livro, o nome do autor e o ano de publicação.
select l.titulo, a.nome as 'nome do autor', l.ano_publicacao as 'ano de publicação' from tb_livros as l
inner join tb_autores as a
on l.id_autorL = a.id_autor;

-- 3. Liste o nome do membro, o título do livro e a data de empréstimo.
select m.nome as 'nome do membro', l.titulo, e.data_emprestimo from tb_emprestimos as e
inner join tb_membros as m
on e.id_membro = m.id_membro
inner join tb_livros as l
on e.id_livro = l.id_livro;
-- 4. Liste todos os empréstimos com o nome do membro, título do livro, nome do autor e data de devolução.
select e.id_emprestimo, m.nome as 'nome do membro', l.titulo, a.nome as 'nome do autor', e.data_devolucao from tb_emprestimos as e
inner join tb_membros as m
on e.id_membro = m.id_membro
inner join tb_livros as l
on e.id_livro = l.id_livro
inner join tb_autores as a
on l.id_autorL = a.id_autor;

-- LEFT JOIN ----------------------------------------------------------------------------------------------
-- 5. Liste todos os membros e, caso existam, os livros que eles já emprestaram.
select m.nome as 'nome do membro', e.id_emprestimo, l.titulo from tb_membros as m
left join tb_emprestimos as e
on m.id_membro = e.id_membro
inner join tb_livros as l
on e.id_livro = l.id_livro;

-- 6. Liste todos os autores e os livros que eles escreveram (mesmo que algum autor ainda não tenha livros cadastrados).
select a.nome as 'nome do autor', l.titulo from tb_autores as a
left join tb_livros as l
on a.id_autor = l.id_autorL;

-- RIGHT JOIN ---------------------------------------------------------------------------------------------
-- 7. Liste todos os livros e, caso tenham, o nome do autor correspondente.
select l.titulo, a.nome as 'nome do autor' from tb_autores as a
right join tb_livros as l
on l.id_autorL = a.id_autor;

-- 8. Liste todos os livros e, caso tenham, os membros que os emprestaram.
select l.titulo, m.nome, e.id_emprestimo, e.data_emprestimo from tb_emprestimos as e
right join tb_livros as l
on e.id_livro = l.id_livro
inner join tb_membros as m
on m.id_membro = e.id_membro;
