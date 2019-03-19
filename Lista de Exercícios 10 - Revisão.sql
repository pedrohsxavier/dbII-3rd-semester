/* Lista de Exercícios - Revisão */

-- QUESTÃO 1 --
Create table Esporte (
      codesp   		serial,
      descesp    	varchar(25));

Create table Atleta (
      Codatl		serial,
      Nome              varchar(30),
      datanasc          date, 
      bolsa	        numeric (14,2),
      esporte           integer);

alter table esporte add constraint pkesp primary key(codesp);
alter table atleta add constraint pkatleta primary key(codatl);
alter table atleta add constraint fkatlesp foreign key(esporte) references esporte; 

SELECT * FROM Esporte
SELECT * FROM Atleta

insert into Esporte values(1, 'Futebol')
insert into Esporte values(2, 'Basquete')
insert into Esporte values(3, 'Badminton')

insert into Atleta values (1, 'Lionel Messi', '1985-05-02', 7000, 1)
insert into Atleta values (2, 'Stephen Curry', '1988-07-22', 6000, 2)
insert into Atleta values (3, 'Leroy Sane', '1994-01-30', 5000, 1)
insert into Atleta values (4, 'Michael Jordan', '1962-10-24', 8000, 2)
insert into Atleta values (5, 'Kobe Bryant', '1981-04-06', 6000, 2)

-- QUESTÃO 2 --
DO $$
Begin 
	update Atleta set bolsa = bolsa * 1.10
	where codatl = 7;
	if not found then
		raise notice 'Atleta nao existente';
		insert into atleta values(6, 'Raul Gil', null, null, 3);
	end if;
END $$;

-- QUESTÃO 3 --
CREATE OR REPLACE function atualizar(perc INTEGER)
returns void
as $$
declare c_atl cursor for select * from atleta;
declare status varchar(30);
declare valor_b decimal(14,2);
BEGIN
	status = 'NAO ATUALIZADO';
	select avg(bolsa) into valor_b from atleta;
	for var in c_atl loop
		if var.bolsa < valor_b then
			status = 'ATUALIZADO';
			update atleta set bolsa = bolsa + (bolsa * (perc/100))
			where codatl = var.codatl;
			raise notice 'Nome Atleta = %', var.nome;
			raise notice 'Bolsa = %', var.bolsa;
			raise notice 'Status: %', status;
			else
			raise notice 'Nome Atleta = %', var.nome;
			raise notice 'Bolsa = %', var.bolsa;
			raise notice 'Status: %', status;
		end if;
	end loop;
END;
$$ LANGUAGE 'plpgsql';

select atualizar(10);

-- QUESTÃO 4

DROP function esp(espor text)
-- QUESTÃO 5
CREATE OR REPLACE function esp(espor text)
returns int
as $$
declare num int;
BEGIN
	SELECT count(nome) into num FROM atleta a JOIN esporte e
	ON a.esporte = e.codesp
	WHERE e.descesp = espor;
	raise notice 'Numero de atletas que praticam esse esporte: %', num;
	return num;
	
END;
$$ LANGUAGE 'plpgsql';

SELECT esp('Volei');
SELECT esp('Futebol');