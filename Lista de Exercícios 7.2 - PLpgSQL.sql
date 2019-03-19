SELECT * FROM produto

alter table produto add quantidade integer;

alter table produto add status varchar(40);
update produto
set quantidade = 40;

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
End$$;


Do $$ Declare
	qtd_atual produto.quantidade%type;
	v_cod produto.codprod%type;
	p_cursor_prod cursor for
	select codprod,quantidade from produto;
Begin
	open p_cursor_prod;
	loop
	fetch p_cursor_prod into v_cod,qtd_atual;
		if qtd_atual > 30 then
		update produto
		set status = 'Estoque dentro do esperado'
		where codprod = v_cod;
		else update produto
		set status = 'Estoque fora do limite mínimo'
		where codprod = v_cod;
		end if;
		exit when not found;
	end loop;
	close p_cursor_prod;
End$$;

/*  ---------------- Rascunho -----------------
Do $$   
	Declare
	qtd_atual produto.quantidade%type;
	v_cod produto.codprod%type;
	p_cursor cursor for
	SELECT codprod, quantidade FROM produto;
	
Begin
	FOR var IN p_cursor LOOP
		insert into produto values
			(v_cod, qtd_atual)
	End LOOP;
End $$;
*/