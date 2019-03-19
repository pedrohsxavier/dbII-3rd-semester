SELECT * FROM Departamento

select * from departamento;
INSERT INTO departamento VALUES (default, 'Marketing', 'Centro');
INSERT INTO departamento VALUES (default, 'Vendas', 'Centro');
INSERT INTO departamento VALUES (default, 'Financeiro', 'Centro');
select * from departamento;
COMMIT;

SELECT * FROM departamento;
INSERT INTO departamento VALUES (default, 'Treinamento', 'Centro');
INSERT INTO departamento VALUES (default, 'Financeiro', 'Centro');
SELECT * FROM departamento;
ROLLBACK;
SELECT * FROM departamento;

CREATE ROLE ph LOGIN
PASSWORD 'bd2'
SUPERUSER CREATEDB CREATEROLE;
commit;

Select * from Departamento;

Insert into Departamento (coddepto , nome, local) values(7, 'Recrutamento', 'Centro');

Insert into Departamento (coddepto , nome, local) values(12, 'Teste', 'Teste');
commit;



/* Usuário phsx*/
Grant all on Departamento to phsx;

SELECT * FROM Departamento
commit;

Insert into Departamento (coddepto , nome, local) values(6, 'Treinamento', 'Centro');

SELECT * FROM Departamento

Insert into Departamento (coddepto , nome, local) values(12, 'Teste', 'Teste');
commit;
select * FROM Departamento