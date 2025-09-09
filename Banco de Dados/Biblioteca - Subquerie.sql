use db_biblioteca;

-- a. Liste os autores que possuem livros com ano de publicação maior que a média de anos de publicação de todos os livros cadastrados.
select avg(ano_publicacao) from tb_livros;

select a.nome as 'Autor', a.id_autor from tb_autores as a
inner join tb_livros as l
on a.id_autor = l.id_autorL
where l.ano_publicacao > (select avg(ano_publicacao) from tb_livros);

-- b. Liste os livros que foram emprestados ao menos uma vez.
select * from tb_livros;
select * from tb_emprestimos;
select * from tb_livros where id_livro in (select id_livro from tb_emprestimos group by id_livro);

-- c. Consulte os livros que ainda não foram emprestados.
select * from tb_livros where id_livro not in (select id_livro from tb_emprestimos group by id_livro);
