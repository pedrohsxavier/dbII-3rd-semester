/* LISTA DE EXERCÍCIOS */

/* Questão 1 */
select * from artista

CREATE VIEW artistaV (codigo, nome, datanasc) AS
select codart, nomeart, datanasc
from artista

select * from artistaV

/* Questão 2 */
select * from filme
select * from estudio

CREATE VIEW filmeV (titulo, duracao, ano, nomeestudio) AS
select titulo, duracao, ano, nomeest
from filme f JOIN estudio e
ON f.codest = e.codest

select * from filmeV

/* Questão 3 */
select * from artista
select * from artistaV

insert into artistaV values(9,'Mariana Ximenes', '1978-11-27')

/* Foi possível inserir na tabela por meio da view, pois na view, há o campo código referente a chave primária da tabela artista, e fora esse campo, não há outro não nulo.*/
/* Questão 4 */

/* Não será possível inserir o registro, pois há campos utilizados em/de outras tabelas.*/

/* Questão 5 */
UPDATE artistaV
	set datanasc = '1978-11-28'
	where nome = 'Mariana Ximenes'

/* Questão 6 */
select * from artistaV
select * from artista

delete from artistaV
	where codigo = 9

/* Questão 7 */
select * from filme
select * from filmeV

DROP view filmeV

/* Questão 8 */
select * from artista
select * from personagem
select * from filme

CREATE VIEW artano2016 (nome) AS 
select nomeart from artista a JOIN personagem p
ON a.codart = p.codart
JOIN filme f
ON p.codfilme = f.codfilme
WHERE ano = 2016

select * from artano2016

/* Questão 9 */
select * from artista

CREATE VIEW artB (nome, codigo, pais) AS
select nomeart, codart, pais from artista
WHERE nomeart like 'B%'
WITH CHECK OPTION

select * from artB

insert into artB values('Ben Stiller', 9, 'USA')