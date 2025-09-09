use ClinicaVetBD;


-- INNER JOIN ---------------------------------------------------------------------------------------------
-- Liste o nome do pet, o nome do cliente e o telefone do cliente para todos os pets cadastrados.
select p.nome, c.nome, c.telefone from tb_clientes as c
inner join tb_pets as p
on c.id_cliente = p.id_cliente;

-- Liste a data, a descrição do atendimento, o nome do pet e o nome do veterinário responsável.
select a.data_atendimento, a.descricao, p.nome as 'Nome do Pet', v.nome as 'Veterinário' from tb_atendimentos as a
inner join tb_pets as p
on a.id_pet = p.id_pet
inner join tb_veterinarios as v
on a.id_veterinario = v.id_veterinario;

-- Liste o nome do veterinário e todos os pets que ele já atendeu.
select v.nome as 'Veterinário', p.nome as 'pet' from tb_atendimentos as a
inner join tb_veterinarios as v
on a.id_veterinario = v.id_veterinario
inner join tb_pets as p
on a.id_pet = p.id_pet;


-- Mostre o nome do cliente, o nome do pet e a especialidade do veterinário para cada atendimento realizado.
select c.nome as 'Cliente', p.nome as 'Pet', v.especialidade as 'Especialidade do Vet', a.id_atendimento as 'Atendimentos' from tb_atendimentos as a
inner join tb_pets as p
on a.id_pet = p.id_pet
inner join tb_veterinarios as v
on a.id_veterinario = v.id_veterinario
inner join tb_clientes as c
on p.id_cliente = c.id_cliente;

-- LEFT JOIN ----------------------------------------------------------------------------------------------
-- Liste todos os clientes e, caso existam, seus respectivos pets (mesmo que não tenham atendimento registrado).
select c.nome as 'Clientes', p.nome as 'Pets' from tb_clientes as c
left join tb_pets as p
on c.id_cliente = p.id_cliente;

-- Liste todos os veterinários e, caso existam, os atendimentos realizados por eles.
select v.nome as 'Veterinários', a.data_atendimento, a.descricao from tb_veterinarios as v
left join tb_atendimentos as a
on v.id_veterinario = a.id_veterinario;

-- RIGHT JOIN ---------------------------------------------------------------------------------------------

-- Liste todos os pets e, caso existam, seus respectivos donos (mesmo que alguns registros de clientes não existam).
select p.nome as 'Pets', p.raca as 'Raça', c.nome as 'clientes' from tb_clientes as c
right join tb_pets as p
on c.id_cliente = p.id_cliente;

-- Liste todos os atendimentos, mesmo que algum veterinário não esteja cadastrado na tabela.
select a.id_atendimento as 'id do atendimento', a.data_atendimento, a.descricao as 'descrição', v.nome as 'veterinario' from tb_veterinarios as v
right join tb_atendimentos as a
on v.id_veterinario = a.id_veterinario;

