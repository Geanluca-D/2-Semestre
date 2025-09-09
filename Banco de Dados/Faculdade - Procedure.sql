-- PROCEDURE --------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 1: Crie uma procedure chamada insere_professor que insere um professor na tabela professores e retorna o ID gerado.
delimiter $$
create procedure insere_professor(
in p_nome varchar(100),
in p_departamento varchar(100),
in p_data date
)
begin
	insert into tb_professores (nome, departamento, data_admissao)
	values (p_nome, p_departamento, p_data);
    select last_insert_id() as id_gerado;
end$$
delimiter ;

call insere_professor('Carlos', 'Exatas', '2025-01-01');

-- Exercício 2: Crie uma procedure chamada atualiza_disciplina que recebe o ID de uma disciplina e atualiza o nome dessa disciplina.
delimiter $$
create procedure atualiza_disciplina(
in p_id int,
in p_novo_nome varchar(100)
)
begin
    update tb_disciplinas set nome = p_novo_nome where id_disciplina = p_id;
    select * from tb_disciplinas where id_disciplina = p_id;
end$$
delimiter ;

call atualiza_disciplina(1, 'Contabilidade Avançada');

-- Exercício 3: Crie uma procedure chamada remove_estudante que remove um estudante da tabela estudantes com base no ID passado como parâmetro.
delimiter $$

create procedure remove_estudante(
in p_id int
)
begin
    delete from tb_estudantes where id_estudante = p_id;
    select concat('Estudante com ID ', p_id, ' removido.') as resultado;
end$$
delimiter ;

call remove_estudante(2);

-- Exercício 4: Crie uma procedure chamada consulta_professor que retorna o nome e departamento de um professor com base no ID passado.
delimiter $$
create procedure consulta_professor(
in p_id int
)
begin
    select nome, departamento from tb_professores where id_professor = p_id;
end$$
delimiter ;

call consulta_professor(1);

-- Exercício 5: Crie uma procedure chamada atualiza_nota que atualiza a nota de um estudante para uma disciplina específica, com base no ID da matrícula.
delimiter $$
create procedure atualiza_nota(
in p_id_matricula int,
in p_nova_nota decimal(5,2)
)
begin
    update tb_notas set nota = p_nova_nota where id_matricula = p_id_matricula;
    select * from tb_notas where id_matricula = p_id_matricula;
end$$
delimiter ;

call atualiza_nota(1, 7.5);