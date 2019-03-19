/* Slide 14 - Funções e Exceções */

/* Exemplo 1 */
Create or replace function verificaArt(codigo integer)
Returns varchar
As $$
Declare nome varchar(25);
Begin
select nomeart into nome from artista
where codart = codigo;
IF NOT FOUND THEN
Return 'Nenhum artista com esse código foi encontrado.';
END IF;
return nome;
End;
$$ LANGUAGE 'plpgsql';

Select verificaart(1);
select verificaart(111);

/* Exemplo 2 */
create or replace function verificaart2(integer)
returns varchar
As $$
Declare r record;
begin
select into r * from artista where codart = $1;
if not found then
RAISE EXCEPTION 'Artista não existente--> %', $1
USING HINT = 'Por favor, verifique o código do artista';
end if;
return r.nomeart;
End;
$$ LANGUAGE 'plpgsql';

select verificaart2(1);
select verificaart2(111);

/* Exemplo 3 */
CREATE OR REPLACE FUNCTION testains(cod integer,nome
varchar(25))
RETURNS integer AS $$
BEGIN
Insert into estudio(codest,nomeest) values (cod,nome);
Return 1;
EXCEPTION
WHEN unique_violation THEN
raise notice 'Já existe esse registro';
return -1;
WHEN OTHERS THEN
-- fazer algo
RETURN -1;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM estudio
SELECT testains(5, 'Dream Works');

/* Exemplo 4 */
/* Tabela Produto */

/* Exemplo 5 */
CREATE OR REPLACE FUNCTION testaContagem(limite integer,
vpais artista.pais%type)
RETURNS void AS $$
Declare
contagem integer;
info2 varchar(40);
BEGIN
SELECT count(*) into strict contagem from artista where pais = vpais;
If contagem >= limite Then
RAISE exception 'Atingiu o limite';
End If;
EXCEPTION
WHEN raise_exception THEN
info2 = 'Artistas de ' || vpais ||' possuem ' || contagem;
INSERT INTO logcontagem (id, info) VALUES (default, info2);
END;
$$ LANGUAGE plpgsql;


SELECT * from artista

create table logcontagem (id serial, info varchar(40));
Drop table logcontagem

select testaContagem(6,'USA');
select testaContagem(6,'Brasil');
select testaContagem(1,'Japão');
select * from logcontagem;

/* Exemplo 6 */
-- Fazer --