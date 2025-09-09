use clinicavetbd;

-- EXERCICIO 1. Crie uma stored procedure que adicione um novo veterinário na tabela Veterinarios.
delimiter $$
create procedure insertVeterinario(
in p_id_veterinario int,
in p_nome varchar(255),
in p_especialidade varchar(255),
in p_telefone varchar(15)
)
begin
	insert into tb_veterinarios(id_veterinario, nome, especialidade, telefone)
    values (p_id_veterinario, p_nome, p_especialidade, p_telefone);
end$$
delimiter ;
select * from tb_veterinarios;
call insertVeterinario('4', 'Marco', 'Aves', '11933332222');

-- EXERCICIO 2. Crie uma stored procedure para atualizar os dados de um cliente, como nome, endereço e telefone.
delimiter $$
create procedure updateClientes(
in p_id_cliente int,
in p_nome varchar(255),
in p_endereco varchar(255),
in p_telefone varchar(15)
)
begin
	update tb_clientes set nome = p_nome, endereco = p_endereco, telefone = p_telefone where id_cliente = p_id_cliente;
end$$
delimiter ;
select * from tb_clientes;
call updateClientes('2', 'Carlos Gustavo', 'Rua Três Predas 231', '11911114444');

-- EXERCICIO 3. Crie uma stored procedure que registre um novo atendimento de um pet, verificando se o veterinário e o pet existem.
delimiter $$
create procedure insertAtendimento(
in p_id_atendimento int,
in p_data_atendimento date,
in p_descricao varchar(255),
in p_id_pet int,
in p_id_veterinario int
)
begin
	declare v_count_pet int;
    declare v_count_veterinario int;
    
    -- verifica se o pet existe
    select count(*) into v_count_pet from tb_pets where id_pet = p_id_pet;
    
    -- verifica se o veterinario existe
    select count(*) into v_count_veterinario from tb_veterinarios where id_veterinario = p_id_veterinario;
    
    -- se ambos existem, insere o atendimento
    if v_count_pet > 0 and v_count_veterinario > 0 then
		insert into tb_atendimentos (id_atendimento, data_atendimento, descricao, id_pet, id_veterinario)
        values (p_id_atendimento, p_data_atendimento, p_descricao, p_id_pet, p_id_veterinario);
	else
		signal sqlstate '45000'
        set message_text = 'Pet ou Vetrinário não encontrados';
	end if;
end$$
delimiter ;

select * from tb_atendimentos;
call insertAtendimento('5','2025-08-25','Análise das vistas','1','1');