use clinicavetbd;

select * from tb_pets;

alter table tb_pets add idade int(5);

insert into tb_pets (id_pet, nome, tipo, raca, data_nascimento, id_cliente) values(
	'5',
    'Zilla',
    'Réptil',
    'Salamandra',
    '2023-05-06',
    '1'
);

/*
TRIGGER
-- set new.idade = timestampdiff(year, new.data_nascimento, curdate());

*/