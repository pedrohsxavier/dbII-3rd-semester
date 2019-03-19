CREATE TABLE filmesaventura AS
select codfilme, titulo
from filme f join categoria c on f.codcateg = c.codcateg
where c.desccateg = 'Aventura'

select * from filme
select * from categoria

select * from filmesaventura
insert into filmesAventura values(2,'Batman')

create table estudio1 as
select * from estudio where 1=2

select * from estudio1

select * from artista
order by codart

/* QUESTÃO 1 */
UPDATE artista SET cidade = 'San Diego'
where nomeart = 'Cameron Diaz'

UPDATE artista SET cidade = 'Smyrna'
where nomeart = 'Julia Roberts'

UPDATE artista SET cidade = 'Shawnee'
where nomeart = 'Brad Pitt'

UPDATE artista SET cidade = 'Peekskill'
where nomeart = 'Mel Gibson'

UPDATE artista SET cidade = 'Wellington'
where nomeart = 'Russel Crowe'

UPDATE artista SET cidade = 'Syracuse'
where nomeart = 'Tom Cruise'

/* QUESTÃO 2 */
insert into artista values(8, 'Selton Mello', 'Passos', 'Brasil', '1972-12-30')

/* QUESTÃO 3 */
select titulo from filme
where duracao > 135

/* QUESTÃO 4 */
select * from filme
select * from categoria

select desccateg
FROM filme f JOIN categoria c
ON f.codcateg = c.codcateg
where titulo = 'Encontro Explosivo'

/* QUESTÃO 5 */
select * from artista
select * from personagem
select * from filme

select nomeart FROM
artista a JOIN personagem p
ON a.codart = p.codart
JOIN filme f
ON p.codfilme = f.codfilme
where titulo = 'Encontro Explosivo'

/* QUESTÃO 6 */
/* Inserir dois filmes e personagens */
select * from artista
select * from filme
select * from categoria
select * from personagem
select * from estudio

insert into filme values(7, 'Bright', 2017, 117, 4, 3)
insert into filme values(8, 'Spiderman', 2002, 121, 4, 3)

/* Personagens não foram inseridos no banco */
insert into personagem values( 8, 8, 'Mary Jane', 8000.0)
insert into personagem values( 8, 8, 'Peter Parker', 8000.00)

/* QUESTÃO 7 */
/* Selecionar artistas que começam com a letra 'B' e participaram de filmes de Aventura */
select * from artista
select * from personagem
select * from filme
select * from categoria

select nomeart from artista a JOIN personagem p
ON a.codart = p.codart
JOIN filme f
ON p.codfilme = f.codfilme
JOIN categoria c
ON f.codcateg = c.codcateg
where nomeart like 'B%' and desccateg = 'Aventura'

/* QUESTÃO 8 */
select * from filme
select * from estudio
select * from categoria

select titulo, nomeest, desccateg FROM filme f JOIN estudio e
ON f.codest = e.codest
JOIN categoria c
ON f.codcateg = c.codcateg

/* QUESTÃO 9 */
select desccateg, count(desccateg) as contagem from categoria
group by desccateg
order by desccateg

/* QUESTÃO 10 */
/* Quantos artistas participaram em filmes da categoria romance */
select * from artista
select * from personagem
select * from filme
select * from categoria

select count(nomeart) from artista a JOIN personagem p
ON a.codart = p.codart
JOIN filme f
ON p.codfilme = f.codfilme
JOIN categoria c
ON f.codcateg = c.codcateg
WHERE desccateg = 'Romance'

/* QUESTÃO 11 */
select a.nomeart, p.nomepers
from artista a left outer join personagem p on a.codart = p.codart

/* Exibe todos os artistas e seus respectivos personagens, quando existir. */

/* QUESTÃO 12 */
select * from artista
select * FROM personagem

select distinct nomeart from artista a JOIN personagem p
ON a.codart = p.codart
WHERE cache > (select avg(cache) from personagem)