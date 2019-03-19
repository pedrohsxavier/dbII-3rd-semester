/* IFPB - TSI */
/* DISCIPLINA: BANCO DE DADOS II */
/* ALUNO: PEDRO HENRIQUE DE SALES XAVIER */
/* QUESTÃO 1 */

/* LISTA DE EXERCÍCIOS 6 - ÍNDICES */

SELECT * FROM filme

create table testaFilme as select * from filme;
select * from testafilme;

DO $$DECLARE i int:= 0;
BEGIN
    WHILE I <= 200000 LOOP
             INSERT INTO testafilme select * from filme;
             I := I + 1;
    END LOOP;
END$$;
/* 20.6 secs */

select titulo from testafilme order by titulo;
/* 27.2 secs */

EXPLAIN select titulo from testafilme order by titulo; 

create index testaFilmeindex on testafilme(titulo);
/* 11.8 */

select titulo from testafilme order by titulo;
/* 20.8 */
EXPLAIN select titulo from testafilme order by titulo;

select relpages from pg_class where relname = 'filme';
/* 1 */
select relpages from pg_class where relname = 'testafilme';
/* 10257 */

/* QUESTÃO 2 */
/* Sem índice: 3.0secs, 200002 linhas. */
select titulo from testafilme where ano = 2005;

create index testaAnoindex on testafilme(ano);
/* 3.8secs */

select titulo from testafilme where ano = 2005;
/* Com índice: 17msec, 200082 linhas. */

/* QUESTÃO 3 */
CREATE index ind_pais on artista(pais);

/* QUESTÃO 4 */


/* QUESTÃO 5 */
