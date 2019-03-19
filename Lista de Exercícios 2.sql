/* QUESTÃO 1.1 */
select titulo from filme
where codest in (select codest
		from estudio
		where nomeest like 'P%')

/* Exibe o título dos filmes quando o nome do estúdio começar com a letra 'P'. */

/* QUESTÃO 1.2 */
select * from categoria
select * from filme

select desccateg from categoria
where codcateg in (select codcateg from filme)

/* QUESTÃO 1.3 */
select * from personagem

select nomeart from artista a JOIN personagem p
ON a.codart = p.codart
where nomepers in (select nomepers from personagem
			where nomepers = 'Natalie')

/* QUESTÃO 1.4 */
select * from artista
select * from personagem

	/* Usando NOT EXISTS */
select * from artista a
where not exists (select * from personagem
			where codart = a.codart)

	/* Usando NOT IN */


/* QUESTÃO 1.5 */
select * from estudio

select titulo from filme f
where exists (select nomeest from estudio
		where codest = f.codest and nomeest like 'P%')

/* QUESTÃO 2 */
select * from filme
select * from estudio

CREATE TABLE filmeEst as select titulo, nomeest from filme f JOIN estudio e
ON f.codest = e.codest

select * from filmeEst

/* QUESTÃO 3 */
select nomeart from artista
where codart in (select codart from personagem
			where codfilme in (select codfilme from filme
						where duracao > 120))

/* Exibe o artista que possui um personagem nos filmes com duração maior que 120 minutos */

/* Usando JOIN */
select * from personagem
select * from filme

select distinct nomeart from artista a JOIN personagem p
ON a.codart = p.codart
JOIN filme f
ON p.codfilme = f.codfilme
WHERE duracao > 120

/* São semelhantes, com a única diferença na ordem de exibição. */

/* QUESTÃO 4 */
select codart from artista
where pais = 'USA'
	INTERSECT
	select codart from personagem

/*  */

/* QUESTÃO 5 */
select codart from artista
	EXCEPT
	select codart from personagem

/*  */

/* QUESTÃO 6 */

select nomeart from artista a join personagem p on a.codart = p.codart
where cache = (select max(cache) from personagem)

/*  */