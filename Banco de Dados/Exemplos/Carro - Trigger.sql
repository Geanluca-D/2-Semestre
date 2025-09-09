CREATE DEFINER = `root`@`localhost` TRIGGER `tb_carro_AFTER_UPDATE` AFTER UPDATE ON `tb_carro` FOR EACH ROW
BEGIN
	if new.valor <> old.valor then
		insert into tb_historico values (null, now(), old.valor, new.valor, new.id);
	end if;
END