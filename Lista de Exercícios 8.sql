/* IFPB */
/* TSI - Sistemas para Internet */
/* Disciplina: Banco de Dados II */
/* Aluno: Pedro Henrique de Sales Xavier */
/* Oitava Lista de Exercícios - Funções */

SELECT * FROM pedido
SELECT * FROM produto

alter table produto add quantidade integer;

alter table produto add status varchar(40);
update produto
set quantidade = 10;

Select * from produto;

select * from produto;
update produto set status = null where codprod = 10; 
select atualizaStatus(10);

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

/* QUESTÃO 1 */
CREATE OR REPLACE FUNCTION atualizaStatus (codigo INTEGER)
RETURNS void
AS $$
DECLARE qtd_atual produto.quantidade%type;
BEGIN
SELECT quantidade into STRICT qtd_atual from produto
where codprod = codigo;
if qtd_atual > 30
then
update produto
set status = 'Estoque dentro do esperado'
WHERE codprod = codigo;
else
update produto
set status = 'Estoque fora do limite minimo'
WHERE codprod = codigo;
end if;
END;
$$ LANGUAGE 'plpgsql';

SELECT * FROM produto
SELECT atualizaStatus(10);
SELECT atualizaStatus(45);
SELECT atualizaStatus(25);
SELECT atualizaStatus(22);
SELECT atualizaStatus(15);
SELECT atualizaStatus(44);

/* ? INTO STRICT; OTHERS */

/* QUESTÃO 2 */
SELECT atualizaStatus(11);

CREATE OR REPLACE FUNCTION atualizaStatus (codigo INTEGER)
RETURNS void
AS $$
DECLARE qtd_atual produto.quantidade%type;
BEGIN
SELECT quantidade into STRICT qtd_atual from produto
where codprod = codigo;
if qtd_atual > 30
then
update produto
set status = 'Estoque dentro do esperado'
WHERE codprod = codigo;
else
update produto
set status = 'Estoque fora do limite minimo'
WHERE codprod = codigo;
end if;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	raise notice 'Nao encontrado';
	WHEN OTHERS THEN
	raise notice 'Erro no codigo inserido';
END;
$$ LANGUAGE 'plpgsql';

SELECT * FROM produto

/* QUESTÃO 3 */

/* Funcao imcompleta */
CREATE table fornecedor(
	cod serial not null,
	nome varchar(30),
	cnpj varchar(15),
	email varchar(15));

SELECT * FROM fornecedor

CREATE OR REPLACE FUNCTION inserirFornecedor (nome varchar(30), cnpj varchar(15), email varchar(15))
RETURNS INTEGER
AS $$
BEGIN
if
INSERT INTO fornecedor VALUES(nome, cnpj, email)
RETURN 1
end if
EXCEPTION
	WHEN unique_violation THEN
	RAISE NOTICE 'CODIGO INVALIDO'
	RETURN -1;
	WHEN OTHER THEN
	RAISE NOTICE 'NAO FOI POSSIVEL INSERIR FORNECEDOR'
	RETURN -1;
END;
$$ LANGUAGE 'plpgsql';

/* QUESTÃO 4 */


/* QUESTÃO 5 */

