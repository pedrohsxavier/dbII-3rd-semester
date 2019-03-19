CREATE ROLE dysf LOGIN
PASSWORD 'bd2'
SUPERUSER CREATEDB CREATEROLE

CREATE ROLE bd2 LOGIN PASSWORD 'bd2'
valid until '28-08-2018'

Create schema locais
authorization dysf

ALTER TABLE public.cidade SET SCHEMA
locais

select * from locais.cidade

create table locais.estado(sigla char(2), nome
varchar(20), constraint pkest primary key(sigla))

select * from locais.estado

alter table locais.cidade add uf char(2);
alter table locais.cidade add constraint fkest foreign key(uf) references
locais.Estado

insert into locais.estado values('PB','Paraíba')
insert into locais.estado values('PE','Pernambuco')

update locais.cidade
set uf = 'PB'
where nome = 'João Pessoa' or nome = 'Campina Grande';
insert into locais.cidade values(3,'Recife','PE')

/* Permitindo acesso ao esquema locais para o outro usuário (bd2)*/
Grant usage on schema locais to bd2

CREATE or replace VIEW locais.CidadeeUF AS
SELECT c.nome, e.nome as "UF"
FROM locais.cidade c join locais.estado e
on c.uf = e.sigla

select * from locais.CidadeeUF

grant select on locais.cidadeeUF to bd2

SELECT * FROM locais.cidadeeUF
