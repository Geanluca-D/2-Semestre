use db_biblioteca;
-- Ex 01 ------------------------------------------------------------------------------------------------------------------------------------------------------
select * from tb_autores;

insert into tb_autores (id_autor, nome, data_nascimento) values (
	'6',
    'Rubert Santos',
    '2015-02-15'
);

/*
TRIGGER
-- Definição da idade
	declare idade int;
	set idade = timestampdiff(year, new.data_nascimento, curdate());
    
 -- Mensagem de erro   
    if idade < 18 then
		signal sqlstate '45000'
        set message_text = 'O autor não pode ser menor de idade!';
	end if;

*/

-- Ex 02 ------------------------------------------------------------------------------------------------------------------------------------------------------
select * from tb_emprestimos;

insert into tb_emprestimos (id_emprestimo, id_membro, id_livro, data_emprestimo) values (
	'16',
    '4',
    '1',
    '2025-05-01'
);
/*
TRIGGER
set new.data_devolucao = date_add(new.data_emprestimo, interval 15 day);

*/

-- Ex 03 ------------------------------------------------------------------------------------------------------------------------------------------------------
select * from tb_emprestimos;

insert into tb_emprestimos (id_emprestimo, id_membro, id_livro, data_emprestimo, data_devolucao) values (
	'21',
    '4',
    '1',
    '2025-08-22',
    '2025-08-30'
);

/*
TRIGGER
declare total_emprestimo int;
    
    select count(id_membro) into total_emprestimo from tb_emprestimos
    where id_membro = new.id_membro and data_devolucao > now();
    
    if total_emprestimo >= 3 then
		signal sqlstate '45000'
		set message_text = 'Não foi possível registrar o empréstimo, o membro possui 3 empréstimos pendentes';
    end if;

*/

-- Ex 04 ------------------------------------------------------------------------------------------------------------------------------------------------------
select * from tb_membros;

insert into tb_membros (id_membro, nome) values(
	'6',
    'Caick'
);

/*
TRIGGER
set new.data_adesao = now();

*/

-- Ex 05 ------------------------------------------------------------------------------------------------------------------------------------------------------
select * from tb_autores;

insert into tb_autores (id_autor, nome) values(
	'6',
    'Douglas miranda'
)

/*
TRIGGER
-- Se o autor existe (SELECT)
	if exists (select 1 from tb_autores where lower(nome) = lower(new.nome)) then

-- Mensagem de erro
		signal sqlstate '45000'
		set message_text = 'O autor já está cadastrado';
	end if;

*/