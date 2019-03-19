CREATE ROLE phsx LOGIN PASSWORD 'bd2'
SUPERUSER CREATEDB CREATEROLE;

create table cidade(cod integer, nome varchar(20), constraint
pkcid primary key(cod));
insert into cidade values (1,'João Pessoa');

select * from cidade

CREATE ROLE bd2 LOGIN PASSWORD 'bd2'
valid until '28-08-2018'

Grant select on cidade to bd2

Revoke select on cidade from bd2

Grant insert on cidade to bd2

CREATE role grupoBD2

Grant select on cidade to grupoBD2

GRANT grupoBD2 TO bd2



select * from cidade

insert into cidade values(2,'Campina Grande')

delete from cidade where cod = 2