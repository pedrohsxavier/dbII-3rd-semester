/* IFPB */
/* Banco de Dados II */
/* 5ª Lista - Exercícios de Revisão */
/* Pedro Henrique de Sales Xavier */

Begin;
Create table testeTransacao (coluna1 serial,coluna2 varchar(10));
Alter table testeTransacao add constraint pk_t primary key(coluna1);
Commit;

Begin;
Insert into testeTransacao values (default,'AAA');
Insert into testeTransacao values (default,'ABC');
Insert into testeTransacao values (default,'BBB');
Insert into testeTransacao values (default,'BCD');
Insert into testeTransacao values (default,'CCC');
Insert into testeTransacao values (default,'CDE');
Select * from testeTransacao;
savepoint spt1;
Insert into testeTransacao values (default,'DDD');
Insert into testeTransacao values (default,'DEF');
Insert into testeTransacao values (default,'EEE');
Select * from testeTransacao;

/* Questão 1 */
/* a. Quantos registros existem na tabela TesteTransacao? */
/* 9 registros foram inseridos na tabela testeTransacao */

DROP table testeTransacao

/* b. Faça um rollback para spt1. */
Rollback to spt1; 

/* c. Quantos registros agora? */
Select * from testeTransacao;
/* Há somente 6 registros. O comando Rollback to spt1 faz com que todos os registros entre o rollback e o savepoint não sejam persistidos no banco, pois não foi efetuado o commit. */

/*Execute agora a 2a parte: */

Insert into testeTransacao values (default,'EFG');
Insert into testeTransacao values (default,'FFF');
Insert into testeTransacao values (default,'FGH');
Select * from testeTransacao;

/* a. Quantos registros têm agora na tabela testeTransação? */
/* 9 registros estão contidos na tabela */

/* b. Faça um rollback (geral). O que aconteceu? Explique. */
Rollback;
/* O Rollback (geral) faz com que todas as inserções não sejam efetuadas no banco, fazendo com que nenhum registro seja salvo. */

/* c. Quantas transações ocorreram? */
/* 2 transações. A de criação da tabela e inserção/seleção de registros. */

/* d. Inicie nova transação e insira 6 registros. */
Begin;
Insert into testeTransacao values (default,'AAA');
Insert into testeTransacao values (default,'ABC');
Insert into testeTransacao values (default,'BBB');
Insert into testeTransacao values (default,'BCD');
Insert into testeTransacao values (default,'CCC');
Insert into testeTransacao values (default,'CDE');
Select * from testeTransacao;

/* e. Faça commit. */
commit;

/* f. Volte à configuração de commit automático. */
/*Ativar Auto-commit*/

/* Questão 2 */

Select * from engenheiro
Select * from projeto
Select * from atua

ALTER table engenheiro add salario numeric(15,2)
ALTER table projeto add area varchar(30)

UPDATE engenheiro SET salario = 5000
WHERE codigo = 1001

UPDATE engenheiro SET salario = 7200
WHERE codigo = 1104

UPDATE engenheiro SET salario = 9800
WHERE codigo = 2208

UPDATE projeto SET area = 'Diversos'
WHERE titulo = 'Viaduto Lins Rabelo'

UPDATE projeto SET area = 'Educação'
WHERE titulo = 'Escola Duarte da Silveira'

UPDATE projeto SET area = 'Lazer'
WHERE titulo = 'Praça da Independência'

/* 1. Insira mais 2 registros em cada tabela. */

insert into engenheiro values(3042, 'Lauro Manoel', 10000);
insert into engenheiro values(1014, 'Roberto Nobrega', 8900);
SELECT * FROM engenheiro;

insert into projeto values(222 , 'Estádio Ronaldão', 'Esportes');
insert into projeto values(100, 'Escola Monteiro Lobato', 'Educação');
SELECT * FROM projeto;

insert into atua values('Arquiteto', 3042, 222);
insert into atua values('Fiscal', 1014, 100);
SELECT * FROM atua;

/* 2. A transação foi efetuada com sucesso? Realize um commit. */
/* Sim. Todos os registros foram inseridos com sucesso. */

/* 3. Verifique os nomes dos engenheiros que ganham acima da média. */
SELECT nome FROM engenheiro
WHERE salario > (SELECT avg(salario) FROM engenheiro)

/* 4. Mostre a quantidade de engenheiros por área. */

select * from engenheiro
select * from projeto
select * from atua

SELECT count(e.codigo) as numero, area FROM Engenheiro e JOIN atua a
ON e.codigo = a.codengenheiro
JOIN projeto p
ON p.codigo = a.codprojeto
GROUP BY area

/* 5. Verifique o seguinte comando */

select nome
from engenheiro
where codigo in (select codengenheiro
                  from atua
                  where codprojeto in (select codigo
                                     from projeto 
                                     where area like 'Banco de Dados'))
/* O que ele faz? */
/* Exibe o nome dos engenheiros que atuam em um projeto cuja área é Banco de Dados. */

/* Reescreva usando JOIN */

Select nome FROM Engenheiro e JOIN atua a
ON e.codigo = a.codengenheiro
JOIN projeto p
ON a.codprojeto = p.codigo
WHERE area like 'Banco de Dados'

/* 6. Verifique o comando: */
select codigo 
 from engenheiro
  where salario > 1200 
	INTERSECT
	  select codengenheiro 
	  from atua;

/* O que ele faz? */
/* Exibe todos os códigos dos funcionários com salário maior que 1200 e que estão associados a um projeto */

/* Refaça o comando usando uma subquery. */
SELECT codigo FROM engenheiro
WHERE codigo IN (SELECT codengenheiro from atua
		WHERE salario > 1200)

/* Depois, refaça-o usando JOIN. */
SELECT codigo from engenheiro e JOIN atua a
ON e.codigo = a.codengenheiro
WHERE salario > 1200

/* 7. Verifique agora o seguinte comando: */
/* Antes, insira mais um engenheiro */

SELECT * FROM Engenheiro
insert into engenheiro values(2500, 'Túlio Ricardo', 6000);

select codigo 
  from engenheiro 
except
  select codengenheiro 
   from atua;

/* O que ele faz? */
/* Exibe o código dos engenheiros que não participam da tabela atua. */

/* Refaça o comando usando uma subquery. */
SELECT codigo from engenheiro
	where codigo NOT IN (SELECT codengenheiro FROM atua)

/* Depois, refaça-o usando JOIN (Utilize left ou right join). */
SELECT codigo from engenheiro e LEFT JOIN atua a
ON e.codigo = a.codengenheiro
WHERE codengenheiro is null

/* 8. Verifique a seguinte consulta. O que ela faz? Ela pode ser reescrita? Mostre como, se for possível. Justifique sua escolha de escrita. */
/* Antes, insira mais um projeto. */

/* Inserir um projeto */

select codproj, titulo
	From projeto P
	Where not exists (select *
		            From atuação A
				Where A.codproj = P.codproj);
