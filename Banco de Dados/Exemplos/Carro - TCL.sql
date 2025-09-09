-- Quando houver uma falha no processo, ele não salva nada
use db_carro;

select @@autocommit;

set @@autocommit = off; -- desativa o salvar automaticamente

select * from tb_proprietario;

-- ROLBACK SIMPLES
-- INSERT
insert into tb_proprietario values (
'6',
'juscelino',
'6',
'85'
);

rollback; -- CTRL Z nas inserções

commit; -- Salva as inserções

start transaction; -- Agrupa as alterações para serem todas commitadas ou dar o roll back em todas
	insert into tb_proprietario values (
    '6',
    'Carol',
    '3'
    );
    
select * from tb_carro;

alter table tb_historico
modify id_historico int auto_increment;


update tb_carro set valor = 200.00 where id_carro = 1;

select * from tb_proprietario;
select * from tb_carro;

alter table tb_proprietario add data_nascimento date;

insert into tb_proprietario (id_proprietario, nome, id_carroF, idade, data_nascimento) values(
	'7',
    'Arthur',
    '7',
    null,
    '2000-01-01'
);

select * from tb_proprietario;