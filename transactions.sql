SELECT * FROM Empregado
SELECT * FROM Departamento

Begin;
INSERT INTO empregado VALUES (default, 'Renato', 'Martins',
current_date, 'chefe', 4500, 1,1);
SAVEPOINT sp1;
INSERT INTO empregado VALUES (default, 'Marcia', 'Guerra',
current_date, 'balconista', 5500, 1,2);
select * from empregado;
COMMIT;

Begin;
INSERT INTO empregado VALUES (default, 'Andrea',
'Gomes',current_date, 'chefe', 4700, 1,1);
SELECT * FROM empregado;
Savepoint sp2;
INSERT INTO empregado VALUES (default, 'Carmem',
'Gomes',current_date, 'diretor', 3700, 1,1);
SELECT * FROM empregado;
ROLLBACK to sp2;
SELECT * FROM empregado;
Commit;

Begin;
INSERT INTO empregado VALUES (default, 'Ariel',
‘Vargas',current_date, 'chefe', 4700, 1,1);
SAVEPOINT my_savepoint;
INSERT INTO empregado VALUES (default, 'Camila',
‘Mendes',current_date, 'diretor', 3700, 1,1);
RELEASE SAVEPOINT my_savepoint;
SELECT * FROM empregado;
Commit;

SELECT * FROM Departamento;
SELECT * FROM Empregado