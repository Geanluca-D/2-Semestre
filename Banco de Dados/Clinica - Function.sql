use clinicavetbd;

-- Exercicio 1. Crie uma função que receba o id_cliente e retorne a quantidade de pets que esse cliente possui.
delimiter $$
create function totalPets(p_id_cliente int)
returns int
reads sql data
begin
	declare totalPet int;
	select count(id_pet) into totalPet from tb_pets where id_cliente = p_id_cliente;
    return totalPet;
end$$
delimiter ;

select * from tb_pets;
select totalPets('2');

-- Exercicio 2. Crie uma função que recebe o id_pet e retorna a data da última consulta do pet.
delimiter $$
create function ultimoAtend(p_id_pet int)
returns date
reads sql data
begin
	declare ultimaData date;
	select data_atendimento into ultimaData from tb_atendimentos where id_pet = p_id_pet order by data_atendimento desc limit 1;
    return ultimaData;
end$$
delimiter ;

select * from tb_atendimentos;
select ultimoAtend('1');

-- Exercicio 3. Crie uma função que receba o id_veterinario e retorne o número total de atendimentos feitos por ele.
delimiter $$
create function totalAtend(p_id_veterinario int)
returns int
reads sql data
begin
	declare atend int;
	select count(id_veterinario) into atend from tb_atendimentos where id_veterinario = p_id_veterinario;
	return atend;
end$$
delimiter ;

select * from tb_atendimentos;
select totalAtend('1');