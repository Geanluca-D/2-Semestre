create database empresa_xpto;
use empresa_xpto;

create table tb_clientes(
id_cliente int auto_increment primary key,
nome varchar(100) not null,
email varchar(100),
preferencias json
);

select * from tb_clientes;

insert into tb_clientes (nome, email, preferencias) values(
'Felipe', 'felipeProfessor@gmail.com', '{"interesses":["livros", "computação"], "notificações":true}'
),(
'Nicole','nicole@gmail.com', '{"interesses":["programação", "C#"], "notificações":false}'
);

select * from tb_clientes where preferencias = '{"interesses":["livros", "computação"], "notificações":true}';

select * from tb_clientes where JSON_CONTAINS(preferencias->'$.interesses','"livros"');

select JSON_VALID('{"interesses":["livros" "computacão"], "notificacoes": true}');

select * from tb_clientes where json_extract(preferencias, '$.notificacoes') = false;

select nome, json_extract(preferencias, '$.interesses') as interesses from tb_clientes where json_extract(preferencias, '$.notificacoes') = false;

select nome,
json_extract(preferencias, '$.interesses[0]') as interesse1,
json_extract(preferencias, '$.interesses[1]') as interesse2,
json_extract(preferencias, '$.interesses[2]') as interesse3
from tb_clientes;

SELECT nome, JSON_KEYS(preferencias) from tb_clientes;

update tb_clientes set preferencias = json_insert (preferencias, '$.premium', true) where id_cliente=2;


-- json_set att um campo
-- json_remove remove um campo do documento
select * from tb_clientes;

select nome,
preferencias->'$.interesses[0]' as interesse1,
preferencias->'$.interesses[1]' as interesse2,
preferencias->'$.interesses[2]' as interesse3
from tb_clientes;

select nome,
json_unquote(preferencias->'$.interesses[0]') as interesse1,
json_unquote(preferencias->'$.interesses[1]') as interesse2,
json_unquote(preferencias->'$.interesses[2]') as interesse3
from tb_clientes;

select nome,
preferencias->>'$.interesses[0]' as interesse1,
preferencias->>'$.interesses[1]' as interesse2,
preferencias->>'$.interesses[2]' as interesse3
from tb_clientes;