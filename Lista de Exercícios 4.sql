/* IFPB */
/* CURSO: TSI - SISTEMAS PARA INTERNET */
/* ALUNO: PEDRO HENRIQUE DE SALES XAVIER */
/* DISCIPLINA: BANCO DE DADOS II */

/* LISTA DE EXERCÍCIOS 4 */

/* QUESTÃO 1 */
CREATE ROLE phsx LOGIN
PASSWORD 'bd2'
SUPERUSER CREATEDB CREATEROLE

/* QUESTÃO 2 */
CREATE DATABASE Projetos

/* QUESTÃO 3 */
CREATE SCHEMA Projs AUTHORIZATION phsx

/* QUESTÃO 4 */
CREATE TABLE Engenheiro(
	codigo integer,
	nome varchar(40),
	constraint pk_codeng primary key (codigo));

CREATE TABLE Projeto(
	codigo integer,
	titulo varchar(60),
	constraint pk_codproj primary key (codigo));

CREATE TABLE Atua(
	funcao varchar(50),
	codEngenheiro integer,
	codProjeto integer,
	constraint pk_atua primary key (codEngenheiro, codProjeto),
	constraint fk_codEng foreign key (codEngenheiro) references Engenheiro,
	constraint fk_codProj foreign key (codProjeto) references Projeto);


/* QUESTÃO 5 */
INSERT into Engenheiro values(1001, 'Antonio Laerte');
INSERT into Engenheiro values(1104, 'Carlos Martins');
INSERT into Engenheiro values(2208, 'Emanuel Pereira');
INSERT into Projeto values(101, 'Escola Duarte da Silveira');
INSERT into Projeto values(220, 'Viaduto Lins Rabelo');
INSERT into Projeto values(304, 'Praça da Independência');
INSERT into Atua values('Arquiteto', 1001, 101);
INSERT into Atua values('Contador', 1104, 220);
INSERT into Atua values('Fiscal', 2208, 304);


/* QUESTÃO 6 */
SELECT * FROM Engenheiro
SELECT * FROM Projeto
SELECT * FROM Atua

/* QUESTÃO 7 */
CREATE VIEW ENGPROJ
(NOME, TITULO) AS
	SELECT nome, titulo FROM Engenheiro e
	JOIN Atua a
	ON e.codigo = a.codEngenheiro
	JOIN Projeto p
	ON p.codigo = a.codProjeto

/* QUESTÃO 8 */
SELECT * FROM Projs.ENGPROJ

ALTER VIEW ENGPROJ SET SCHEMA Projs
ALTER TABLE Engenheiro SET SCHEMA Projs
ALTER TABLE Projeto SET SCHEMA Projs
ALTER TABLE Atua SET SCHEMA Projs

/* QUESTÃO 9 */
CREATE ROLE Estagiario

/* QUESTÃO 10 */
CREATE ROLE Gerente

/* QUESTÃO 11 */
GRANT insert, select, delete, update ON Projs.Engenheiro, Projs.Projeto, Projs.Atua TO GROUP Gerente

/* QUESTÃO 12 */
GRANT select ON Projs.ENGPROJ TO Estagiario

/* QUESTÃO 13 */
CREATE ROLE tj LOGIN
PASSWORD 'bd2'

GRANT Gerente TO tj

/* QUESTÃO 14 */
CREATE ROLE jp LOGIN
PASSWORD 'bd2'

GRANT Estagiario TO jp

/* QUESTÃO 15 */

/* QUESTÃO 16 */

