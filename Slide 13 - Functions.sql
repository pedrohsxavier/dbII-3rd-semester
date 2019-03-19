/* Slide 13 - Functions */

CREATE OR REPLACE FUNCTION InsereCategoria (codigo INTEGER, nome VARCHAR(25))
RETURNS void
AS $$
BEGIN
	INSERT INTO "public".categoria VALUES (codigo, nome);
	END;
$$ LANGUAGE 'plpgsql';

Select * from Categoria;
Select InsereCategoria (7, 'Sci-Fi');

/* Function - Cotacao */
Create or replace function DolarToReal (dolar in numeric, cotacao numeric)
Returns numeric
As $$
Begin
	Return dolar *cotacao;
End;
$$ LANGUAGE 'plpgsql';

Do $$ declare v numeric;
begin
	v:= DolarToReal(100, 3.69);
	raise notice 'Valor em Real: %',v;
End$$;
