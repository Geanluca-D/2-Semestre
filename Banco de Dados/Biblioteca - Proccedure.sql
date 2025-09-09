use db_biblioteca;
select * from tb_autores;

-- EXERCICIO 1. Crie uma stored procedure que insira um novo autor na tabela Autores.
delimiter $$
create procedure insertAutor(
in p_id_autor int,
in p_nome varchar(255),
in p_data_nascimento date
)
begin
	insert into tb_autores(id_autor, nome, data_nascimento)
    values(p_id_autor, p_nome, p_data_nascimento);
end$$
delimiter ;

call insertAutor('6', 'Roberto Carlos', '1970-04-02');

-- EXERCICIO 2. Crie uma stored procedure para atualizar a data de devolução de um empréstimo já registrado.
delimiter $$
create procedure updateEmprestimo(
in p_id_emprestimo int,
in p_data_devolucao date
)
begin
	update tb_emprestimos set data_devolucao = p_data_devolucao where id_emprestimo = p_id_emprestimo;
end$$
delimiter ;

select * from tb_emprestimos;
call updateEmprestimo('20', '2025-01-01');

-- EXERCICIO 3. Crie uma stored procedure que consulte todos os livros emprestados por um determinado membro, retornando os títulos dos livros e as datas de empréstimo.
delimiter $$
create procedure consulteEmprestimos(
in p_id_membro int
)
begin
	select m.id_membro, l.titulo, e.data_emprestimo from tb_emprestimos as e
    inner join tb_livros as l
    on e.id_livro = l.id_livro
    inner join tb_membros as m
    on e.id_membro = m.id_membro
    where m.id_membro = p_id_membro;
end$$
delimiter ;

call consulteEmprestimos('2');