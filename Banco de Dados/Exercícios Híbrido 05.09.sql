-- 1- Crie a Tabela para armazenar os dados no MySQL.
create database db_eventos;
use db_eventos;

create table tb_eventos(
id_evento int auto_increment primary key,
titulo varchar(100),
categoria varchar(100),
detalhes json,
inscricoes json
);

-- 2- Adicione pelo menos 5 registros com os campos JSON preenchidos na tabela (Veja o exemplo acima).
insert into tb_eventos (titulo, categoria, detalhes, inscricoes) values
('Workshop de Python', 'Programação',
 '{"local":"Sala 101","data":"2025-09-10","palestrantes":["Ana Silva","Carlos Souza"]}',
 '[{"nome":"Felipe","email":"felipe@email.com","presente":true},
   {"nome":"Maria","email":"maria@email.com","presente":false}]'),

('Curso de UX Design', 'Design',
 '{"local":"Auditório 2","data":"2025-09-15","palestrantes":["João Almeida","Paula Rocha"]}',
 '[{"nome":"Luiz","email":"luiz@email.com","presente":true},
   {"nome":"Camila","email":"camila@email.com","presente":true}]'),

('Palestra de Marketing Digital', 'Marketing',
 '{"local":"Sala 202","data":"2025-09-20","palestrantes":["Fernanda Lima"]}',
 '[{"nome":"Rafael","email":"rafael@email.com","presente":false},
   {"nome":"Tatiana","email":"tatiana@email.com","presente":false}]'),

('Workshop de Inteligência Artificial', 'Programação',
 '{"local":"Lab 5","data":"2025-09-25","palestrantes":["Carlos Souza","Mariana Dias"]}',
 '[{"nome":"Bruno","email":"bruno@email.com","presente":true},
   {"nome":"Alice","email":"alice@email.com","presente":false}]'),

('Curso de Fotografia Criativa', 'Design',
 '{"local":"Estúdio 1","data":"2025-09-30","palestrantes":["Ricardo Santos"]}',
 '[{"nome":"Henrique","email":"henrique@email.com","presente":true},
   {"nome":"Sofia","email":"sofia@email.com","presente":false}]');

-- 3- Faça as queries:
-- A)Liste todos os eventos que têm um palestrante específico pelo nome (detalhes).
select id_evento, titulo, categoria from tb_eventos where json_contains(detalhes->'$.palestrantes', '"Carlos Souza"');

-- B)Liste os participantes presentes de cada evento (inscricoes).
select id_evento, titulo, json_extract(inscricoes, '$[*].nome') as participantes_presentes from tb_eventos where json_contains(inscricoes, '{"presente": true}');

-- C)Mostre o local e o nome do primeiro palestrante de cada evento.
select id_evento, titulo,
json_unquote(json_extract(detalhes, '$.local')) as sala,
json_unquote(json_extract(detalhes, '$.palestrantes[0]')) as primeiro_palestrante
from tb_eventos;

-- D)Selecione eventos com participantes que ainda não estiveram presentes (presente = false).
select id_evento, titulo, categoria from tb_eventos where json_contains(inscricoes, '{"presente": false}');