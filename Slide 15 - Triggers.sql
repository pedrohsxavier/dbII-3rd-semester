-- Slide 15 - Triggers

SELECT * FROM empregado

CREATE TABLE empaudit (
 matemp integer NOT NULL,
 dataalter varchar NOT NULL );
 
CREATE OR REPLACE FUNCTION emplogfunc()
 RETURNS trigger AS $$
 BEGIN
 INSERT INTO empaudit (matemp, dataalter) VALUES
(new.matricula, current_timestamp);
 RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER logEmptrigger AFTER INSERT
ON empregado FOR EACH ROW
EXECUTE PROCEDURE emplogfunc();

select * from empregado;
select * from empaudit;

insert into
empregado(matricula,primeironome,salario,gerente,coddepto)
values (default,'Patricia',7000,2,2);



create table empregado_backup as
select * from empregado where 1 = 2;

select * from empregado;
select * from empregado_backup;

CREATE OR REPLACE FUNCTION repempfunc()
 RETURNS trigger AS $$
 BEGIN
 Insert into empregado_backup values
(new.Matricula, new.primeironome, new.sobrenome,
new.dataadmissao, new.cargo, new.salario, new.gerente,
new.coddepto);
 RETURN NEW;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER replicaInsEmp
After INSERT ON empregado
For each row Execute procedure repempfunc();

Insert into empregado values (default,'Jorge', 'Alberto',current_date,
'Analista de Sistemas',6000, 1,1);



CREATE OR REPLACE FUNCTION verificaop_emp() RETURNS
TRIGGER AS $$
 BEGIN
 -- Utiliza a variável TG_OP para descobrir a operação sendo realizada.
 IF (TG_OP = 'DELETE') THEN
 raise notice 'Operação Delete sobre %', TG_TABLE_NAME;
 RETURN OLD;
 ELSIF (TG_OP = 'UPDATE') THEN
 raise notice 'Operação Update sobre %', TG_TABLE_NAME;
 RETURN NEW;
 ELSIF (TG_OP = 'INSERT') THEN
 raise notice 'Operação Insert sobre %', TG_TABLE_NAME;
 RETURN NEW;
 END IF;
 RETURN NULL;
 END;
 $$ language plpgsql; 

CREATE TRIGGER emp_audit
AFTER INSERT OR UPDATE OR DELETE ON empregado
FOR EACH ROW EXECUTE PROCEDURE verificaop_emp();
select * from empregado;

insert into empregado(matricula,primeironome)
	values(default,'Mariana');
delete from empregado where matricula = 22;
update empregado set salario = 3000 where matricula = 2;

update empregado set salario = 3000;

drop trigger emp_audit on empregado;

CREATE TRIGGER emp_audit
 AFTER INSERT OR UPDATE OR DELETE ON empregado
 EXECUTE PROCEDURE verificaop_emp();

update empregado set salario = 3000;

