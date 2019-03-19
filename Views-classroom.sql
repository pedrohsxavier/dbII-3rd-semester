CREATE VIEW Prquilo
(codigo, descricao,unidade)
AS Select codprod,descricao,unidade
From produto
Where unidade = 'KG';

Select * from Prquilo;
Select descricao from prquilo;

Select * from produto

CREATE OR REPLACE VIEW
VendSal(codigo,nome,salario)
AS Select codvend,nome,salariofixo
From vendedor;

Select * from VendSal;
Select nome from vendSal;

Select * from prquilo;
Select * from produto;

Insert into PRquilo values (110,'Arroz','KG');
Insert into PRquilo values (100,'Oleo','L');

CREATE OR REPLACE VIEW ProdutodescA AS
SELECT codprod, descricao
FROM produto
WHERE descricao like 'A%'
WITH CHECK OPTION

Select * from produtodesca

Insert into ProdutodescA values (40, 'Manteiga')

Insert into ProdutodescA values (41, 'Azeite')

Update PRquilo
Set descricao = 'Arroz Integral'
Where codigo = 110

Delete from PRquilo where descricao = 'Arroz Integral'

CREATE or replace VIEW Listapedidos AS
Select nome, descricao
From vendedor v join pedido p on v.codvend =
p.codvend Join itenspedido i on p.numped = i.numped
join produto pr on i.codprod = pr.codprod
order by nome

select * from listapedidos