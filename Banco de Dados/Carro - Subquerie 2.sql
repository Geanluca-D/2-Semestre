use db_carro;

-- Proprietários de carros acima da média de preço
-- Liste o nome dos proprietários que possuem carros com valor acima da média de todos os carros.
select p.nome as 'Proprietario', c.marca, c.modelo from tb_proprietario as p
inner join tb_carro as c
on p.id_carroF = c.id_carro
where valor > (select avg(valor) from tb_carro);

-- Carros vendidos mais que a média geral de vendas
-- Liste os modelos de carro cujo numero_vendas seja maior que a média de vendas de todos os carros.
select id_carro, marca, modelo, numero_vendas from tb_carro where numero_vendas > (select avg(numero_vendas) from tb_carro);

-- Carros que já tiveram valor acima da média histórica
-- Mostre os carros cujo valor já foi maior que a média de todos os valores registrados no histórico.
select c.marca, c.modelo from tb_carro as c
inner join tb_historico as h
on c.id_carro = h.id_carro
where valor_anterior > (select avg(valor_novo) from tb_historico);


-- Carros sem histórico de alteração de preço
-- Liste os modelos de carros que não aparecem na tabela historico_preco.
select * from tb_carro where id_carro not in (select id_carro from tb_historico);
