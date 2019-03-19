/* IFPB */
/* Slide 11 - PLpgSQL */
/* Exercícios */

/* Exemplo 2 */
create table testa_bloco (coluna1 integer, coluna2 date);

Do $$
DECLARE
	I INT := 0;
BEGIN
	WHILE I <= 10 LOOP
	INSERT INTO TESTA_BLOCO(coluna1,coluna2)
	VALUES (I,current_date);
	I := I + 1;
END LOOP;
END$$;

DROP table testa_bloco

SELECT * FROM testa_bloco


/* Exemplo 3 */
SELECT * FROM produto

alter table produto add quantidade integer;
alter table produto add status varchar(40);
update produto
set quantidade = 10;
Select * from produto;

Do $$
Declare qtd_atual produto.quantidade%type;
Begin
	select quantidade into qtd_atual from produto
	where codprod = 10;
	if qtd_atual > 30 then
		update produto
		set status = 'Estoque dentro do esperado'
		where codprod = 10;
	else
		update produto
		set status = 'Estoque fora do limite minimo'
	where codprod = 10;
	end if;
End $$;
