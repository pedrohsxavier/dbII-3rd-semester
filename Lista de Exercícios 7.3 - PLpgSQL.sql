/* IFPB */
/* Banco de Dados II */
/* Pedro Henrique */
/* Lista de Exercícios - PLpgSQL */

SELECT * FROM filme
SELECT * FROM artista
SELECT * FROM estudio

/* Questão 1 */
DO $$
	Declare 
	nome varchar(40);
	qtdelinhas integer;
BEGIN
	select nomeart into nome from artista where codart = 2;
	GET DIAGNOSTICS qtdelinhas :=
	ROW_COUNT;
	raise notice 'Nome artista = %', nome;
	raise notice 'Quantidade de registros retornados = %',qtdelinhas;
END$$
/* Resposta: É retornado um registro com dados do artista com o código 2, que é determinado é na consulta. */

/* Questão 2 */
DO $$
	DECLARE
	artreg artista%ROWTYPE;
	info varchar(30);
BEGIN
	artreg.codart := 14;
	artreg.nomeart := 'Michael Keaton';
	artreg.pais := 'USA';
	Select artreg.nomeart || ' é do país '||artreg.pais into info;
	raise notice 'Informação = %', info;
END$$;
/* Retorna uma mensagem, com dados do artista com o código 14, exibindo seu nome e seu país de origem. O ROWTYPE herda características de vários campos de uma vez só. */

/* Questão 3 */
SELECT * FROM artista
ALTER table artista add column indicacaooscar integer
/*-- ALTER table artista drop column indicaooscar --*/

DO $$
BEGIN
	UPDATE artista
	SET indicacaooscar = 10
	WHERE codart = 100;
IF NOT FOUND THEN
	INSERT INTO artista (codart, nomeart, indicacaooscar) VALUES (100, 'XXX', 10);
END IF;
END$$
/* Primeiramente, adicionei o campo indicacaooscar a tabela artista, o código acima tenta atualizar o campo criado setando o valor 10 no registro com codart = 100, /*
/* como não existe, o é executado o IF, que insere na tabela artista um novo registro, com os valores codart = 100, nomeart = 'XXX', indicacaooscar = 10. */

/* Questão 4 */

/* Questão 5 */
DO $$
Begin

END $$

/* Questão 6 */

/* Questão 7 */