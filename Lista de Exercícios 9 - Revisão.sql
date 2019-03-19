/* Lista de Exercícios - Revisão Triggers */

/* QUESTÃO 1 */
-- Desabilitar as triggers existentes para a tabela Empregado.

/* QUESTÃO 2 */
Create or Replace Function trocaNome()
Returns trigger as $$
declare msg varchar(40); 
Begin
  msg = 'Primeiro nome '||old.primeironome|| ' mudou para '||new.primeironome;
  raise notice 'Foi feito: %',msg; 
  return null; 
End; 
$$ LANGUAGE plpgsql; 

CREATE TRIGGER veNome AFTER UPDATE 
  of primeironome ON empregado 
  FOR EACH ROW 
  EXECUTE PROCEDURE trocaNome();

select * from empregado; 

update empregado
	set primeironome = 'TROCA'
	where primeironome = 'Mariana'; 

-- a) O trigger é disparado após o update na coluna primeiro nome da tabela empregado pela função trocanome(), que troca o nome 'Mariana' para 'TROCA'.
-- b) Ele foi disparado após update de primeironome da tabela empregado.
-- c) Old é o valor antigo de primeiro nome, new receberá o novo nome.

/* QUESTÃO 3 */
Create table empLog (
	usuario varchar(20),
	operacao char(1),
	dataHora timestamp
);

CREATE OR REPLACE function logEmp() returns trigger
as $$
BEGIN
	insert into empLog values(current_user, SUBSTR(TG_OP,1,1), current_timestamp);
	return null;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER opuser AFTER UPDATE OR INSERT OR DELETE
ON empregado
FOR EACH ROW
EXECUTE PROCEDURE logEmp();

SELECT * FROM empLog;
SELECT * FROM empregado;

insert into empregado values(22, 'Paulo', 'Roberto', '2018-04-25', 'vendedor', 2000, 1, 2)

UPDATE empregado
SET cargo = 'gerente'
WHERE matricula = 22;

/* QUESTÃO 4 */
CREATE OR REPLACE function testa_salario() returns trigger
as $$
Begin
    If new.salario > 20000 then
        raise exception 'salario alto';
    end if;
    return new; 
    exception
       when raise_exception then
           Raise notice 'Tentativa de aumento exagerada!!! %', new.salario;
           return null;
 end;
$$ LANGUAGE plpgsql;  

create trigger verSalario 
     BEFORE INSERT OR UPDATE OF salario ON empregado
 FOR EACH ROW
 Execute procedure testa_salario(); 
 
 insert into empregado(matricula,primeironome,salario,gerente,coddepto) values (default,'Patricia',27000,2,2);

-- O trigger é disparado antes do insert para checar o valor do salário, e não permite que este valor seja maior que 20000, exibindo a mensagem de excessão.

/* QUESTÃO 5 */


/* QUESTÃO 6 */
