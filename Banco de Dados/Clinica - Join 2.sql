use clinicavetbd;

-- 1. liste o nome do pet, o nome do cliente e o telefone do cliente para todos os pets cadastrados
select p.nome as 'Pet', c.nome as 'Cliente', c.telefone from tb_pets as p
inner join tb_clientes as c
on p.id_cliente = c.id_cliente;

-- 2. Liste todos os clietes e, caso existam, seus respectivos pets (mesmo que não tenham atendimento registrado)
select c.nome as 'Cliente', p.nome as 'Pet' from tb_pets as p
right join tb_clientes as c
on p.id_cliente = c.id_cliente;

-- 3. liste todos os atendimentos, mesmo que algum veterinário não esteja cadastrado na tabela.
select a.id_atendimento, a.data_atendimento, a.descricao, v.nome from tb_atendimentos as a
left join tb_veterinarios as v
on a.id_veterinario  = v.id_veterinario;
