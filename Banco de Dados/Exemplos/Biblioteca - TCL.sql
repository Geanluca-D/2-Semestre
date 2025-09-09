use db_biblioteca;

select * from tb_emprestimos;

insert into tb_emprestimos (id_emprestimo, id_membro, id_livro, data_emprestimo, data_devolucao) values(
	'15',
    '5',
    '2',
    '2025-08-10',
    null
);

alter table tb_emprestimos
drop index id_membro;

alter table tb_emprestimos
modify column id_membro INT(10) NOT NULL;

insert into tb_autores (id_autor, nome, data_nascimento) values(
'6',
'douglas miranda',
'1950-02-03'
);

select * from tb_autores;