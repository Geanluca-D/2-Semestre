use db_biblioteca;

-- Exercicio 1. Crie uma função que recebe o id_autor e retorna a idade do autor com base na data de nascimento.
delimiter $$
create function idadeAutor(p_id_autor int)
returns int
reads sql data
begin
	declare idade int;
    select timestampdiff(year, data_nascimento, curdate()) into idade from tb_autores where id_autor = p_id_autor;
    return idade;
end$$
delimiter ;

select * from tb_autores;
select idadeAutor('1');

-- Exercicio 2. Crie uma função que recebe o id_autor e retorna a quantidade de livros escritos por esse autor.
delimiter $$
create function totalLivros(p_id_autor int)
returns int
reads sql data
begin
	declare livros int;
	select count(id_livro) into livros from tb_livros where id_autorL = p_id_autor;
	return livros;
end$$
delimiter ;

select * from tb_livros;
select totalLivros('1');

-- Exercicio 3. Crie uma função que recebe duas datas e retorna o total de empréstimos realizados nesse período.
delimiter $$
create function totalEmprestimos(p_data1 date, p_data2 date)
returns int
reads sql data
begin
	declare ids int;
	select count(id_emprestimo) into ids from tb_emprestimos where data_emprestimo > p_data1 and data_emprestimo < p_data2;
    return ids;
end$$
delimiter ;

drop function totalEmprestimos;
select * from tb_emprestimos;
select totalEmprestimos('2020-05-01','2024-08-30');

-- Exercicio 4. Crie uma função que retorna a média de dias em que os livros foram emprestados.
delimiter $$
create function medEmpres()
returns decimal(10,2)
reads sql data
begin
	declare media decimal(10,2);
    select avg(timestampdiff(day, data_devolucao, data_emprestimo)) into media from tb_emprestimos;
    return media;
end$$
delimiter ;

select medEmpres();