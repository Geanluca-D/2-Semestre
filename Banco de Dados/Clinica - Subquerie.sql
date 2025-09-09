use clinicavetbd;
-- 01 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Pet mais velho:
-- Liste o nome e a data de nascimento do pet mais antigo da clínica usando uma subquery.

select id_pet, nome as 'Pet', data_nascimento from tb_pets where data_nascimento = (select min(data_nascimento) from tb_pets);

-- 02 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Pet mais novo:
-- Liste o nome e a data de nascimento do pet mais novo usando uma subquery.

select id_pet, nome as 'Pet', data_nascimento from tb_pets where data_nascimento = (select max(data_nascimento) from tb_pets);

-- 03 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Veterinários do último atendimento:
-- Liste o nome de todos os veterinários que realizaram atendimentos na data mais recente registrada.

select v.id_veterinario, v.nome as 'veterinario', a.data_atendimento from tb_atendimentos as a
inner join tb_veterinarios as v
on a.id_veterinario = v.id_veterinario
where a.data_atendimento = (select max(data_atendimento) from tb_atendimentos);
-- 04 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Clientes com mais de um pet:
-- Liste os nomes dos clientes que possuem mais de um pet, utilizando uma subquery para contar a quantidade.
-- opcao 1
select * from tb_pets as p
inner join tb_clientes as c
on c.id_cliente = p.id_cliente 
WHERE c.id_cliente IN (select id_cliente from tb_pets group by id_cliente having count(*) > 1);

-- opcao 2
select * from tb_clientes as c 
where (select count(*) from tb_pets as p where c.id_cliente = p.id_cliente) > 1;

select * from tb_pets;

(select count(id_cliente) from tb_pets group by id_cliente);

select * from tb_pets;
-- 05 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Pets nunca atendidos:
-- Liste o nome de todos os pets que ainda não passaram por atendimento, utilizando uma subquery para verificar.

select p.id_pet from tb_pets as p
inner join tb_atendimentos as a
on p.id_pet = a.id_pet
where p.id_pet not in (select id_pet from tb_atendimentos);

-- 06 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Quantidade de pets por cliente:
-- Para cada cliente, mostre o nome e a quantidade de pets cadastrados, utilizando uma subquery no SELECT.
select c.nome, count(p.id_pet) from tb_clientes as c
inner join tb_pets as p
on c.id_cliente = p.id_cliente
group by p.id_cliente;

-- 07 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Último veterinário cadastrado:
-- Liste todos os atendimentos realizados pelo veterinário mais recentemente cadastrado no sistema.
select * from tb_atendimentos where id_veterinario = (select max(id_veterinario) from tb_veterinarios where id_veterinario in (select id_veterinario from tb_atendimentos));

-- 08 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Atendimento mais antigo – dados completos:
-- Liste todas as informações do atendimento mais antigo registrado, usando uma subquery para identificar a data.
select * from tb_atendimentos as a where data_atendimento = (select min(data_atendimento) from tb_atendimentos);


-- 09 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Clientes que já foram atendidos por mais de um veterinário diferente:
-- Liste os nomes dos clientes que já tiveram atendimentos com pelo menos dois veterinários distintos, usando subquery.
select c.nome from tb_atendimentos as a
inner join tb_pets as p
on a.id_pet = p.id_pet
inner join tb_clientes as c
on p.id_cliente = c.id_cliente
group by p.id_cliente having count(distinct a.id_veterinario) >= 2;

-- 10 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Pets atendidos pelo veterinário mais solicitado:
-- Liste os nomes dos pets que foram atendidos pelo veterinário que mais realizou atendimentos na clínica, usando subquery para identificar esse veterinário.
select p.nome, a.id_veterinario from tb_pets as p
inner join tb_atendimentos as a
on p.id_pet = a.id_pet
where a.id_veterinario = (select id_veterinario from tb_atendimentos group by id_veterinario order by count(*) desc limit 1);
