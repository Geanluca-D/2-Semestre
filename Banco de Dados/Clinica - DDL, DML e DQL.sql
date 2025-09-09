create database ClinicaVetBD;

use ClinicaVetBD;

-- TABELAS --------------------------------------------------------------------------------------------------------------------------------------------
create table tb_veterinarios(
id_veterinario int(10) not null unique,
nome varchar(255),
especialidade varchar(255),
telefone varchar(15),
primary key (id_veterinario)
);

create table tb_clientes(
id_cliente int(10) not null unique,
nome varchar(255),
endereco varchar(255),
telefone varchar(15),
primary key (id_cliente)
);

create table tb_pets(
id_pet int(10) not null unique,
nome varchar(255),
tipo varchar(50),
raca varchar(50),
data_nascimento date,
id_cliente int(10) not null,
primary key (id_pet),
foreign key (id_cliente) references tb_clientes(id_cliente)
);

create table tb_atendimentos(
id_atendimento int(10) not null unique,
data_atendimento date,
descricao varchar(255),
id_pet int(10) not null,
id_veterinario int(10) not null,
primary key (id_atendimento),
foreign key (id_pet) references tb_pets(id_pet),
foreign key (id_veterinario) references tb_veterinarios(id_veterinario)
);

-- VALORES ------------------------------------------------------------------------------------------------------------------------------------------
-- VETERINARIOS -------------------------------------------------------------------------------------------------------------------------------------
insert into tb_veterinarios(id_veterinario, nome, especialidade, telefone) values (
'1',
'Arhtur',
'Felinos',
'11912345678'
);

insert into tb_veterinarios(id_veterinario, nome, especialidade, telefone) values (
'2',
'Letícia',
'Cães',
'11987654321'
);

insert into tb_veterinarios(id_veterinario, nome, especialidade, telefone) values (
'3',
'Gustavo',
'Répteis',
'11911112222'
);
-- CLIENTES -----------------------------------------------------------------------------------------------------------------------------------------
insert into tb_clientes(id_cliente, nome, endereco, telefone) values (
'1',
'Vinícius',
'Rua Iguará 123',
'11944448888'
);

insert into tb_clientes(id_cliente, nome, endereco, telefone) values (
'2',
'Carlos',
'Rua Giestas 321',
'11922223333'
);

insert into tb_clientes(id_cliente, nome, endereco, telefone) values (
'3',
'Caick',
'Rua Alfazemas 99',
'1197779999'
);
-- PETS ---------------------------------------------------------------------------------------------------------------------------------------------
insert into tb_pets(id_pet, nome, tipo, raca, data_nascimento, id_cliente) values (
'1',
'Milly',
'Cachorro',
'Dachshund',
'2020-08-05',
'1'
);

insert into tb_pets(id_pet, nome, tipo, raca, data_nascimento, id_cliente) values (
'2',
'Doug',
'Cachorro',
'Jack Russell Terrier',
'2019-03-24',
'2'
);

insert into tb_pets(id_pet, nome, tipo, raca, data_nascimento, id_cliente) values (
'3',
'Silvester Stalone',
'Gato',
'Rajado',
'2022-11-14',
'3'
);
-- ATENDIMENTOS -------------------------------------------------------------------------------------------------------------------------------------
insert into tb_atendimentos(id_atendimento, data_atendimento, descricao, id_pet, id_veterinario) values (
'1',
'2025-05-30',
'Tratamento de pulgas',
'2',
'2'
);

insert into tb_atendimentos(id_atendimento, data_atendimento, descricao, id_pet, id_veterinario) values (
'2',
'2024-02-28',
'Castração',
'3',
'1'
);

insert into tb_atendimentos(id_atendimento, data_atendimento, descricao, id_pet, id_veterinario) values (
'3',
'2020-08-30',
'Vacinação',
'1',
'3'
);

-- UPDATES ------------------------------------------------------------------------------------------------------------------------------------------
update tb_veterinarios set telefone = '11922221111' where id_veterinario = '3';
update tb_clientes set endereco = 'Rua Giestas 231' where id_cliente = '2';
update tb_pets set data_nascimento = '2022-10-14' where id_pet = '3';
update tb_atendimentos set id_veterinario = '2' where id_atendimento = '3';
update tb_clientes set telefone = '11966669999' where id_cliente = '3';

-- CONSULTAS ----------------------------------------------------------------------------------------------------------------------------------------

-- a. O pet com a data de nascimento mais antigo
select id_pet, data_nascimento from tb_pets order by data_nascimento asc limit 1;

-- b. O pet com a data de nascimento mais recente
select id_pet, data_nascimento from tb_pets order by data_nascimento desc limit 1;

-- c. A quantidade de pets cadastrados no banco de dados
select count(id_pet) as 'Total de pets' from tb_pets;

-- d. Ordene o nome dos pets em ordem crescente
select nome from tb_pets order by nome asc;

-- e. Ordene o nome dos pets em ordem decrescente
select nome from tb_pets order by nome desc;

-- f. Ordene o nome dos veterinários em ordem crescente
select nome from tb_veterinarios order by nome asc;

-- g. Ordene o nome dos veterinários em ordem decrescente
select nome from tb_veterinarios order by nome desc;

-- h. A data de atendimento mais antiga
select data_atendimento from tb_atendimentos order by data_atendimento asc limit 1;

-- i. A data de atendimento mais recente
select data_atendimento from tb_atendimentos order by data_atendimento desc limit 1;