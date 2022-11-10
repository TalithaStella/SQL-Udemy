Lista de exercícios criada por mim para mim.

Usar o banco real. 

USE EXERCICIO;

DESC FUNCIONARIOS;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| idFuncionario | int(11)      | YES  |     | NULL    |       |
| nome          | varchar(100) | YES  |     | NULL    |       |
| email         | varchar(200) | YES  |     | NULL    |       |
| sexo          | varchar(10)  | YES  |     | NULL    |       |
| departamento  | varchar(100) | YES  |     | NULL    |       |
| admissao      | varchar(10)  | YES  |     | NULL    |       |
| salario       | int(11)      | YES  |     | NULL    |       |
| cargo         | varchar(100) | YES  |     | NULL    |       |
| idRegiao      | int(11)      | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+

SELECT COUNT (*) FROM FUNCIONARIOS; = 975

**Criar outras tabelas e linkar (FK)
- Região
- Vendas/Mês
-- Qual o total de vendas por departamento?

--------------------------------------------------------------

-- Quais são os departamentos desse negócio? 
SELECT DEPARTAMENTO FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 1;

+---------------+
| DEPARTAMENTO  |
+---------------+
| Alimentícios  |
| Automotivo    |
| Bebês         |
| Beleza        |
| Books         |
| Brinquedos    |
| Calçados      |
| Computadores  |
| Crianças      |
| Eletronicos   |
| Esporte       |
| Ferramentas   |
| Filmes        |
| Games         |
| Industrial    |
| Jardim        |
| Joalheria     |
| Lar           |
| Música        |
| Outdoors      |
| Roupas        |
| Saúde         |
+---------------+

-- EMAIL DAS MULHERES QUE TRABALHAM COM CRIANÇAS E EMAIL DOS HOMENS QUE TRABALHAM COM AUTOMOTIVO



-- NÚMERO DE MULHERES QUE TRABALHAM COM AUTOMOTIVO E HOMENS QUE TRABALHAM COM CRIANÇAS



-- Qual é a média salarial dos funcionários? 



-- Qual é a média de salario por cargo?



-- QUANTIDADE TOTAL DE HOMENS E MULHERES



-- Traga os funcionarios que trabalhem no departamento de filmes OU no departamento de roupas 



/* O gestor de marketing pediu a lista das funcionariAS que trabalhem no departamento de filmes ou
no departamento lar. 
Ele necessita enviar um email para as colaboradoras desses dois setores. */



-- Traga os funcionarios do sexo masculino ou os funcionarios que trabalhem no setor Jardim 


/* O SETOR SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO VOCÊ TERÁ QUE PASSAR 
A QUERY PARA GERAR O RELATORIO PARA O PROGRAMADOR - (ALIAS E VIEW) */



/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR  DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA O PROGRAMADOR (ALIAS E VIEW) */


/* Trazer o nome do livro e o nome da editora */


/* Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino. */


/* Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino. */


/* Trazer os valores dos livros das editoras de São Paulo. */


/* Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro  */


