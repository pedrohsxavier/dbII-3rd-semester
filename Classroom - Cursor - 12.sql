SELECT * FROM filme

DO $$
DECLARE
	v_estudio estudio%ROWTYPE;
Begin
	SELECT codest, nomeest INTO v_estudio
	FROM estudio
	WHERE codest = 1;
	raise notice 'Estudio selecionado = %',v_estudio.nomeest;
End$$;

select nomeart, cidade
from artista
where codart = 1;

select nomeart, cidade
from artista
where pais = 'USA';


DO $$
Declare
	vdesc categoria.desccateg%type;
	vcursor_categ CURSOR for Select desccateg
	from categoria;
Begin
	Open vcursor_categ;
	LOOP
	fetch vcursor_categ into vdesc;
	EXIT when NOT FOUND;
	raise notice 'Nome Categoria = %', vdesc;
	END LOOP;
Close vcursor_categ;
End$$;


DO $$
Declare
	vdesc categoria.desccateg%type;
	vcursor_categ CURSOR for Select desccateg from categoria;
Begin
	For vcat IN vcursor_categ LOOP
	vdesc := vcat.desccateg;
	raise notice 'Nome Categoria = %', vdesc;
	END LOOP;
End$$;


DO $$
Declare
	localpais artista.pais%TYPE;
	c_artista Cursor (v_pais artista.pais%TYPE) for
	Select * From artista where pais = v_pais;
Begin
	localpais := 'Brasil';
	raise notice 'País = %', localpais;
	For vart IN c_artista(localpais) LOOP
	raise notice 'Nome do Artista = %', vart.nomeart;
	End Loop;
End$$;

create table top as
	select a.codart, nomeart, cache
	from artista a join personagem p
	on a.codart = p.codart
	where 1 = 2;

SELECT * FROM top

DO $$
declare
regart public.top%ROWTYPE;
Begin
For regart IN (Select distinct a.codart, nomeart, cache
FROM artista a join personagem p
on a.codart = p.codart
WHERE cache > 7000) LOOP
Insert into top values
(regart.codart,regart.nomeart, regart.cache);
End loop;
End$$;

SELECT * FROM top order by codart
