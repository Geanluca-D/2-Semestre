-- TRIGGER ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 1: Crie um trigger chamado verifica_nota_maxima que impede a inserção de uma nota superior a 10. -------------------------------------------------------------

/*
CREATE DEFINER=`root`@`localhost` TRIGGER `tb_notas_BEFORE_INSERT` BEFORE INSERT ON `tb_notas` FOR EACH ROW BEGIN
    IF NEW.nota > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nota não pode ser maior que 10';
    END IF;
END
*/

-- Teste
insert into tb_notas (id_matricula, nota, data_lancamento) values (1, 11, curdate());

-- Exercício 2: Crie um trigger chamado atualiza_data_matricula que atualiza a data de matrícula para a data atual sempre que uma nova matrícula for inserida. ------------
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `tb_matriculas_BEFORE_INSERT` BEFORE INSERT ON `tb_matriculas` FOR EACH ROW BEGIN
    SET NEW.data_matricula = CURDATE();
END
*/

-- Teste
insert into tb_matriculas (id_estudante, id_disciplina, data_matricula) values (1, 1, null);
select * from tb_matriculas where id_matricula = 99;

-- Exercício 3: Crie um trigger chamado impede_deletar_disciplina que impeça a exclusão de disciplinas que ainda possuem estudantes matriculados. -------------------------
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `tb_disciplinas_BEFORE_DELETE` BEFORE DELETE ON `tb_disciplinas` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 
               FROM tb_matriculas 
               WHERE id_disciplina = OLD.id_disciplina) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possível deletar disciplina com estudantes matriculados';
    END IF;
END
*/

-- Teste
delete from tb_disciplinas where id_disciplina = 1;
delete from tb_disciplinas where id_disciplina = 99;