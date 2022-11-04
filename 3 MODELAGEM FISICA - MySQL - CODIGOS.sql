Banco de dados é composto por tabelas onde os usuários guardam os dados!! 

MySQL = sistema de gerenciamento de banco de dados (SGBD)
Dentro do SGBD existem vários bancos. 
Vamos criar 1 desses bancos, mas vem com mais bancos (bancos de sistema). 

MySQL - Não se escreve o teste no prompt pq ele execulta tudo e n tem como alterar 

/* Iniciando a modelagem física */

Depois copia e cola lá

/* Criando o BD */

CREATE DATABASE PROJETO;

/* (COPIAR E COLAR NO MYSQL = CLICK DIREITO) */

/* CONECTANDO AO BANCO
A partir do momento que o projeto já esta criado use o comando a baixo para acessar */

USE PROJETO;

/* CRIANDO A TABELA CLIENTE */

CREATE TABLE CLIENTE (
	NOME VARCHAR(30),
	SEXO CHAR (1),
	EMAIL VARCHAR(30),
	CPF INT (11), 
	TELEFONE VARCHAR(30),
	ENDEREÇO VARCHAR(30)
);

/* QUANDO TERMINA A TABELA N PODE COLOCAR A VIRGULA
	VARCHAR - 
	CHAR - 
TUNING - DEIXA O BANCO DE DADOS MAIS RÁPIDO DE SER ACESSADO

{ SEGMENTOS banco: 
AD - Adm Dados: Cuida dos dados
DBA - Infraestrutura dos bancos
TN -  tunning: Rapidez/Performace
BI - Business intelligence: O que ocorreu (passado)
DS - Data Science:  O que pode ocorrer/insits (?)
MD - Mineração de dados: Ligado a DS (?)
}

As áreas tem uma linha de TEMPORARY

[AD/DBA (OLTP) - BI (OLAP) - DS (Com base no passado preve o futuro) = Juntando isso = Tunning */

/*	VERIFICANDO AS TABELAS DO BANCO */

SHOW TABLES; 
/*(Mostra as tabelas do banco - COMANDO SÓ EXISTE NO MYSQL (UM 'PONTERAMENTO' PARA O SELECT)!!!
) É UM TIPO DE PROJEÇÃO */

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */

DESC CLIENTE;
(DESCRIBE: Mostra como é a tabela)

/* INSERINDO DADOS NA TABELA */

/* SINTAXE BÁSICA DE INSERÇÃO - INSERT INTO TABELA */



/*FORMA 1: OMITINDO COLUNAS {

Pode adicionar na ordem que foi descrito, mas ai TEM que seguir a ordem. 
Não é mto segura: se por acaso alguma informação estiver faltando, o próximo dado será interpretado
como aquele que não foi inserido (se tirar o NULL, o proximo dado vira o email e vai dar erro em tudo}*/


INSERT INTO CLIENTE VALUES ('JOAO', 'M', 'JOAO@GMAIL.COM', 988638273, '22923110', 'MAIA LACERDA - ESTACIO - RJ');

INSERT INTO CLIENTE VALUES ('CELIA', 'F', 'CELIA@GMAIL.COM', 541521456, '25078869', 'RIACHUELO - CENTRO RJ');

INSERT INTO CLIENTE VALUES ('JORGE', 'M', NULL, 88755896, '58748895', 'ORCAS - BOM RETIRO - MG');


/*FORMA 2 - COLOCANDO AS COLUNAS{ 
Especifica a ordem de entrada (esta faltando o email e entra na ordem do comando
FORMA MAIS SEGURA pq desegina os dados.): */

INSERT INTO CLIENTE (NOME, SEXO, ENDEREÇO, TELEFONE, CPF) VALUES ('LILIAN', 'F', 'SENADOR SOARES - TIJUCA - RJ', '947785696', 887774856);


/*FORMA 3 - INSERT COMPACTO - SOMENTE MYSQL {
Quando fechar o () já pode abrir outro e vira que segue (ao invés de escrever insert into em todas as inserções)
Da pra designar as colunas se quiser
: */

INSERT INTO CLIENTE VALUES ('ANA', 'F', 'ANA@GMAIL.COM', 85548962, '548556985', 'PRES ANTONIO - CENTRO - sp'),
							('CARLA', 'F', 'CARLA@GMAIL.COM', 7745828, '66587458', 'SAMUEL SILVA - CENTRO - mg');
							
INSERT INTO CLIENTE (NOME, SEXO, ENDEREÇO, TELEFONE, CPF) VALUES ('CLARA', 'F', 'SENADOR SOARES - TIJUCA - RJ', '947785696', 99999999999);

/* no caso acima vai dar erro pq quando escolhemos o tipo INT existe um determinada qty de caracteres que podem ser 
adicionadas, por isso, se a intenção não é fazer calculos com esse INT prefira sempre CHAR (fixo) ou VARCHAR (variavel)*/

/* COMANDO SELECT

COMANDO MAIS IMPORTANTE: se usa em qualquer banco de dados
seleção / projeção (Select) / junção
*/


"MOSTRA NA TELA (SHOW = SELECT)":

SELECT NOW() AS DATAS_HORA;

SELECT 'FELIPE MAFRA';

SELECT 'BANCO DE DADOS';

/* ALIAS ('eilias') DE COLUNAS {
Jeito que vc pode colocar um outro nome naquilo que vc ta mostrando (DADO >>AS NOME<<).
*/

SELECT NOME, SEXO, EMAIL FROM CLIENTE;

SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE; /*ALIAS*/

SELECT NOME, SEXO, EMAIL, ENDEREÇO FROM CLIENTE;

SELECT NOME, SEXO, EMAIL, ENDEREÇO, NOW() AS DATA_HORA FROM CLIENTE; /* Misturando */



/* ->>> APENAS PARA FINS ACADEMICOS <<<-
NÃO USE NA SUA EMPRESA - Vc entrega mais dados do o solicitado e compromete velocidade, tempo, e peso da requisição, fora que atrapalha o carinha do tunning, ignorando também as regras de performace dele. 
*/ 

SELECT * FROM CLIENTE;

/* FILTROS (WHERE = SELEÇÃO)

Filtra a nível de linha 
SELEÇÃO = WHERE*/

SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'M';

SELECT NOME, ENDEREÇO FROM CLIENTE
WHERE SEXO = 'F'; /* O QUE EU ESTOU  PROCURANDO NAO PRECISA ESTAR NO CAMPO DE MOSTRAR */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDEREÇO = 'RJ'; /* NÃO ACHA SOMENTE 1 ELEMENTO DENTRO DE UM CAMPO */


/* lIKE = APROXIMADO */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDEREÇO LIKE 'RJ'; /* APROXIMADO */


/* CARACTER CORINGA % -> QUALQUER COISA */

SELECT NOME, SEXO, ENDEREÇO FROM CLIENTE
WHERE ENDEREÇO LIKE '%RJ';

/* SE POSICIONAR ANTES ESTA PROCURANDO SABENDO QUE VEM COISAS ANTES
SE COLOCAR DEPOIS ESTA PROCURANDO SABENDO QUE TEM COISAS DEPOIS: */

SELECT NOME, SEXO, ENDEREÇO FROM CLIENTE
WHERE ENDEREÇO LIKE 'SAMUEL SILVA%';

/* PRA PROCURAR QUANDO A INFORMAÇÃO TA NO MEIO DE OUTRAS */

SELECT NOME, SEXO, ENDEREÇO FROM CLIENTE
WHERE ENDEREÇO LIKE '%CENTRO%';


/* OUTROS COMANDOS: */

SHOW DATABASES /* MOSTRA TODAS OS BANCOS QUE VC JA CRIOU) */

STATUS /* VAI QUE BATE A DORY E VC N LEMBRA MAIS ONDE TA, O STATUS TE MOSTRA */

/* Comando COUNT */

SELECT COUNT (*) AS "Qty de registros da Tab. Cliente" from CLIENTE;

/* OPERADOR GROUP BY: Ele da o total agrupando pelo que foi pedido. */

SELECT COUNT(*), SEXO
FROM CLIENTE 
GROUP BY SEXO;

/* ORDER BY */

ORDENA

SELECT COUNT(*), sexo, departamento
FROM FUNCIONARIOS
group by sexo, departamento;

/* FILTRANDO VALORES NULOS */

-- Nulo = NULL = VAZIO

SELECT NOME, SEXO, ENDEREÇO
FROM CLIENTE
WHERE EMAIL IS NULL /*Filtra o que É null*/

-- NUNCA SE USA " = NULL " MAS SIM "IS NULL"

SELECT NOME, SEXO, ENDEREÇO
FROM CLIENTE
WHERE EMAIL IS NOT NULL /*Filtra o que NÃO É null*/

/* UPDATE PARA ATUALIZAR VALORES */

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'LILIAN@HOTMAIL.COM';

-- "Sempre use um SELECT antes do update para confirmar se o dado é mesmo o dado correto a ser atualizado"

/* WHERE - MELHOR AMIGO <3 <3 <3 <3 */

UPDATE CLIENTE
SET EMAIL = 'JOAO@HOTMAIL.COM.BR'
WHERE NOME = 'JOAO';

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'LILIAN@HOTMAIL.COM.BR'
WHERE NOME = 'LILIAN';


/* DELETE = APAGAR

CUIDADO COM O DELETE, USE SEMPRE UM SELECT */

DELETE FROM CLIENTE;  -- VAI APAGAR TUDO!!!


-- Conta quantas coisas tem:
SELECT COUNT (*) FROM CLIENTE;  -- total = 6

-- Seleciona quem são as anas
SELECT count (*) FROM CLIENTE 
WHERE NOME = 'ANA';  -- 1 ana


DELETE FROM CLIENTE 
WHERE NOME = 'ANA';  -- Vai apagar a ANA

SELECT COUNT (*) FROM CLIENTE;

-- TAMBÉM PODE USAR OS OUTROS COMANDOS (null, or, and..)

DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'LILIAN@HOTMAIL.COM';

-- Pra se certificar que vc vai apagar só o que vc quer da pra copiar exatamente o comando que vc vai usar e trocar o delete por SELECT

SELECT FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'LILIAN@HOTMAIL.COM';  -- Aqui iria deletar TODAS as pessoas que tivessem o email da lilian

SELECT FROM CLIENTE
WHERE NOME = 'CARLA'
AND EMAIL = 'LILIAN@HOTMAIL.COM'; -- Aqui só vai aparecer a carla com o email errado pq é a unica que contempla as 2 condições

---------------------------------------------

MODELANDO O BANCO DE DADOS: CONSIDERANDO FK, PRIMARY KEY, OBRIGATORIEDADE, CARDINALIDADE:


/* ANOTAÇÕES: 
- NOT NULL - NÃO PODE FICAR VAZIO!!
- ENUM: DOMINIO - CAIXA DE OPÇÕES COM INFORMAÇÕES FIXAS (SEXO, F/M) - (ENUM -->> só existe no mySQL)
- BANCO DE DADOS RELACIONAL - Tem que seguir regras (rígido)
- UNIQUE - COLUNA DE EMAIL E CPF não podem ser REPETIDO ENTRE USUÁRIOS


FOREIGN KEY
Chave estrangeira: Chave primaria de uma tabela (primary key) que vai até a outra tabela para fazer referência entre registros (linka um com o outro)
DEPENDE DIRETAMENTE DA CARDINALIDADE!! (regra de negocio que define)

EM RELACIONAMENTOS 1X1 A FK FICA NA TABELA MAIS FRACA (depende do negocio: Loja = cliente | Estacionamento = Carro)
EM RELACIONAMENTO 1XN A FK FICA NA CARDINALIDADE N 

A FK TEM QUE SER DO MESMO TIPO QUE VC DEFINIU (IDCLIENTE INT = ID_CLIENTE (FK) INT)

PARA DEFINIR O RELACIONAMENTO:
Se eu coloco UNIQUE em um local o banco entende que não pode ser repetido, então ao descrever : "ID_CLIENTE INT UNIQUE" vc também está dizendo que o relacionamento é 1x1

para dizer 1xN é só não colocar o UNIQUE (ver telefones) */


-> SELEÇÃO, PROJEÇÃO, (já vimos) E JUNÇÃO:

/*
(query buscar dados no banco e trazer informação)


PROJEÇÃO: Tudo que vc quer ver na tela = SELECT

SELECT * from cliente

SELECT now (); (traz data e hora)*/



SELEÇÃO: 
/* 
Fazer meu um subconjunto de um conjunto total de registro de uma tabela
Clausula de seleção: WHERE

SELECT NOME, SEXO EMAIL FROM CLIENTE
WHERE SEXO = 'F'; <--- ONDE MORA A SELEÇÃO

(Da pra juntar usando o Where, funciona, mas não é o mais indicado)


Resumindo: 
SELECT NOME, SEXO EMAIL  ----> PROJEÇÃO
FROM CLIENTE  ----> ORIGEM
WHERE SEXO = 'F';  ----> SELEÇÃO*/


COMANDOS DML

/*

LINGUAGEM DE MAQUINA = BINÁRIA (01)

PROG NIVEL MAIS ALTO - ORIENTADO À OBJETO = JAVA, PHP, C#

LINGUAGEM DE 4º GERAÇÃO - PARECIDA COM A LINGUAGEM HUMANA = SQL 

CATEGORIAS:
	DML - DATA MANIPULATION LANGUAGE (manipulação)
	DDL - DATA DEFINITION LANGUAGE (definição/tipagem)
	DCL - DATA CONTROL LANGUAGE (controle de acesso)
	TCL - TRANSACTION CONTROL LANGUAGE (controle de transação - atomicidade)

---------------------------

DML - DATA MANIPULATION LANGUAGE (manipulação):
	INSERT/ SELECT/ WHERE/ DELETE

----------------------------

DDL - DATA DEFINITION LANGUAGE (definição/tipagem)
	Quando vc vai criar a tabela e define os tipos de campos é uma DDL

Varchar, char, enum, INT,  e modificação de tabela. */

--------------------------------------------

Anotação de Peter Chen (?) -- 1,n/1,1/0,n 
(BrModelo) - Mais leve, mas buga
		   - Mais poluído


Anotação de cross -- 1 traço:  1 
				  -- 3 linhas: n (muitos)
(StarUML) - mais clean
		  - Usado em arquitetura de dados

--------------------------------------------


DROP TABLE = APAGA A TABELA!!!


CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M', 'F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO (
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL, 
	BAIRRO VARCHAR(30) NOT NULL, 
	CIDADE VARCHAR(30) NOT NULL, 
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE (
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM ('RES', 'COM', 'CEL') NOT NULL, 
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);


INSERT INTO CLIENTE (IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES 
	(NULL, 'JOAO', 'M', 'JOAO@GMAIL.COM', '78945612364'),
	(NULL, 'CARLOS', 'M', 'CARLOS@GMAIL.COM', '14774489755'),
	(NULL, 'ANA', 'F', 'ANA@GMAIL.COM', '78945632145'),
	(NULL, 'CLARA', 'F', NULL, '45698712333'),
	(NULL, 'JORGE', 'M', 'JORGE@GMAIL.COM', '54879213645'),
	(NULL, 'CELIA', 'F', 'CELIA@GMAIL.COM', '21535468795');


SELECT * FROM CLIENTE

+-----------+--------+------+------------------+----------------+
| IDCLIENTE | NOME   | SEXO | EMAIL            | CPF            |
+-----------+--------+------+------------------+----------------+
|         1 | JOAO   | M    | JOAO@GMAIL.COM   | 78945612364    |
|         7 | CARLOS | M    | CARLOS@GMAIL.COM | 14774489756745 |
|         8 | ANA    | F    | ANA@GMAIL.COM    | 78945632145    |
|         9 | CLARA  | F    | NULL             | 45698712333    |
|        10 | JORGE  | M    | JORGE@GMAIL.COM  | 54879213645    |
|        11 | CELIA  | F    | CELIA@GMAIL.COM  | 21535468795    |
+-----------+--------+------+------------------+----------------+


DESC ENDERECO;

INSERT INTO ENDERECO (IDENDERECO, RUA, BAIRRO, CIDADE, ESTADO, ID_CLIENTE) VALUES
	(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',1),
	(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',7),
	(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',8),
	(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',9),
	(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',10),
	(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',11);

+------------+--------------------+----------+----------------+--------+------------+
| IDENDERECO | RUA                | BAIRRO   | CIDADE         | ESTADO | ID_CLIENTE |
+------------+--------------------+----------+----------------+--------+------------+
|          1 | RUA ANTONIO SA     | CENTRO   | B. HORIZONTE   | MG     |          1 |
|          2 | RUA CAPITAO HERMES | CENTRO   | RIO DE JANEIRO | RJ     |          7 |
|          3 | RUA PRES VARGAS    | JARDINS  | SAO PAULO      | SP     |          8 |
|          4 | RUA ALFANDEGA      | ESTACIO  | RIO DE JANEIRO | RJ     |          9 |
|          5 | RUA DO OUVIDOR     | FLAMENGO | RIO DE JANEIRO | RJ     |         10 |
|          6 | RUA URUGUAIANA     | CENTRO   | VITORIA        | ES     |         11 |
+------------+--------------------+----------+----------------+--------+------------+


DESC TELEFONE;

INSERT INTO TELEFONE VALUES(NULL,'CEL','45655455',1);

INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',7);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',8);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',8);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',8);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',10);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',7);


+------------+------+----------+------------+
| IDTELEFONE | TIPO | NUMERO   | ID_CLIENTE |
+------------+------+----------+------------+
|          1 | CEL  | 45655455 |          1 |-
|          2 | RES  | 56576876 |          7 |+
|          3 | CEL  | 87866896 |          1 |-
|          4 | COM  | 54768899 |          8 |*
|          5 | RES  | 99667587 |          1 |-
|          6 | CEL  | 78989765 |          8 |*
|          7 | CEL  | 99766676 |          8 |*
|          8 | COM  | 66687899 |         10 |
|          9 | RES  | 89986668 |          9 |
|         10 | CEL  | 88687909 |          7 |+
+------------+------+----------+------------+

-- VALORES SE REPETEM PQ NÃO TEM A CLAUSULA UNIQUE, OU SEJA É CARDINALIDADE = N

JOIN:

/* Ação de unir informações de 2 tabelas diferentes que são ligadas pelo mesmo ID. 
No caso abaixo, o JOAO (ID1) mora no centro do RJ, mas não da pra ver na mesma tabela (tabelas !=) a função JOIN
junta as informações pelo ID delas.

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;  <<-- tabela DIFERENTE

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;  <<-- tabela DIFERENTE

+--------+----------------+-----------+ +------------+----------+----------------+
| NOME   | EMAIL          | IDCLIENTE | | ID_CLIENTE | BAIRRO   | CIDADE         |
+--------+----------------+-----------+ +------------+----------+----------------+
| JOAO   | JOAOA@IG.COM   |         1 | |          1 | CENTRO   | RIO DE JANEIRO |
| CARLOS | CARLOSA@IG.COM |         2 | |          2 | ESTACIO  | RIO DE JANEIRO |
| ANA    | ANA@IG.COM     |         3 | |          3 | JARDINS  | SAO PAULO      |
| CLARA  | NULL           |         4 | |          4 | CENTRO   | B. HORIZONTE   |
| CELIA  | JCELIA@IG.COM  |         6 | |          5 | CENTRO   | VITORIA        |
| JORGE  | JORGE@IG.COM   |         5 | |          6 | FLAMENGO | RIO DE JANEIRO |
+--------+----------------+-----------+ +------------+----------+----------------+


PODE USAR O WHERE PARA JUNTAR ESSAS INFORMAÇÕES. FUNCIONA, MAS NÃO É O INDICADO (WHERE = SELEÇÃO):
Quando se usa WHERE o que fazemos é usar a tabela verdade para mostrar o que a gente quer, mas isso o é fazer o
banco procurar por informação que sempre é verdade. 

SELECT NOME, BAIRRO
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE;

INNER JOIN:

Inner Join pega as informações de dentro que são iguais. 
Se tiver uma FK que não tiver informação correspondente em outra tabela, ela não aparece na chamada. 

SELECT NOME, BAIRRO
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

WHERE SEXO = 'F'; <-- Se tiver que procurar add 


SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE;

Os clientes que tiverem mais de 1 telefone apareceram todas as vezes que tiverem telefones para ser mostrado.


JUNTAR MAIS DE 2 TABELAS: 
O uso clausula JOIN é irrestrito, da pra juntar quantas tabelas precisar

SELECT NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;


ERRO DE AMBIGUIDADE: Chave com o mesmo nome nas 2 tabelas.
Poderia ter sido criado a chave como Id_cliente_telefone, mas nem sempre isso é possível então usar: 


SELECT cliente.NOME, cliente.SEXO, endereco.BAIRRO, endereco.CIDADE, telefone.TIPO, telefone.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON cliente.IDCLIENTE = endereco.ID_CLIENTE
INNER JOIN TELEFONE
ON cliente.IDCLIENTE = telefone.ID_CLIENTE;


Outra maneira de ponterar as coisas: (Melhora a performace) USANDO ALIAS:

SELECT c.NOME, c.SEXO, e.BAIRRO, e.CIDADE, t.TIPO, t.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON c.IDCLIENTE = e.ID_CLIENTE
INNER JOIN TELEFONE T
ON IDCLIENTE = t.ID_CLIENTE;

*/

-- Valores preenchidos na tabela no exercicio -- 

/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E 
NAO TENHAM CELULAR */

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, E.BAIRRO, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F' 
AND (ESTADO = 'RJ' AND BAIRRO = 'CENTRO')
AND (TIPO = 'COM' OR TIPO ='RES');
-- Se não colocar o parenteses (precedência), todo mundo que tem telefone RES vai aparecer na pesquisa. -- 

+-----------+---------+------+-------------------+--------+--------+------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | BAIRRO | ESTADO | TIPO | NUMERO   |
+-----------+---------+------+-------------------+--------+--------+------+----------+
|        11 | GIOVANA | F    | NULL              | CENTRO | RJ     | COM  | 55689654 |  -> GIOVANA TEM CELULAR MAS APARECE AQUI (NECESSÁRIO SUBQUERY)
|        19 | CARMEM  | F    | CARMEM@IG.COM     | CENTRO | RJ     | RES  | 77455786 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | CENTRO | RJ     | RES  | 89766554 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | CENTRO | RJ     | RES  | 77755785 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | CENTRO | RJ     | COM  | 44522578 |
+-----------+---------+------+-------------------+--------+--------+------+----------+

--------------------------

TRATANDO VALORES NULOS: 


IFNULL() = ORACLE/ SQL SERVER / POST / ETC. 
-- É UMA FUNÇÃO (now () também é uma função)


--Como se usa: 
IFNULL(COLUNA<-parâmetro, STRING<-msg)


-- Exemplo:
SELECT  C.NOME, 
		IFNULL(C.EMAIL, '************'),
		E.ESTADO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


+---------+---------------------------------+--------+----------+
| NOME    | IFNULL(C.EMAIL, '************') | ESTADO | NUMERO   | <- COLOCAR UM ALIAS PRA MUDAR O NOME DA COLUNA
+---------+---------------------------------+--------+----------+
| JOAO    | JOAO@GMAIL.COM                  | RJ     | 87866896 |
| JOAO    | JOAO@GMAIL.COM                  | RJ     | 99667587 |
| JOAO    | JOAO@GMAIL.COM                  | RJ     | 66687899 |
| CARLOS  | CARLOS@GMAIL.COM                | RJ     | 54768899 |
| CARLOS  | CARLOS@GMAIL.COM                | RJ     | 88687909 |
| ANA     | ANA@GMAIL.COM                   | SP     | 78989765 |
| ANA     | ANA@GMAIL.COM                   | SP     | 99766676 |
| JORGE   | JORGE@GMAIL.COM                 | ES     | 78458743 |
| JORGE   | JORGE@GMAIL.COM                 | ES     | 56576876 |
| JORGE   | JORGE@GMAIL.COM                 | ES     | 89986668 |
| FLAVIO  | FLAVIO@IG.COM                   | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM                   | MG     | 99656675 |
| GIOVANA | ************                    | RJ     | 33567765 |
| GIOVANA | ************                    | RJ     | 88668786 |
| GIOVANA | ************                    | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM                 | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM               | ES     | 88965676 |
| EDUARDO | ************                    | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM                  | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM                 | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM                | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM                   | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM                   | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM               | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM               | RJ     | 44522578 |
+---------+---------------------------------+--------+----------+

SELECT  C.NOME, 
		IFNULL(C.EMAIL, '************') AS EMAIL,
		E.ESTADO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


+---------+-------------------+--------+----------+
| NOME    | EMAIL             | ESTADO | NUMERO   |
+---------+-------------------+--------+----------+
| JOAO    | JOAO@GMAIL.COM    | RJ     | 87866896 |
| JOAO    | JOAO@GMAIL.COM    | RJ     | 99667587 |
| JOAO    | JOAO@GMAIL.COM    | RJ     | 66687899 |
| CARLOS  | CARLOS@GMAIL.COM  | RJ     | 54768899 |
| CARLOS  | CARLOS@GMAIL.COM  | RJ     | 88687909 |
| ANA     | ANA@GMAIL.COM     | SP     | 78989765 |
| ANA     | ANA@GMAIL.COM     | SP     | 99766676 |
| JORGE   | JORGE@GMAIL.COM   | ES     | 78458743 |
| JORGE   | JORGE@GMAIL.COM   | ES     | 56576876 |
| JORGE   | JORGE@GMAIL.COM   | ES     | 89986668 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 99656675 |
| GIOVANA | ************      | RJ     | 33567765 |
| GIOVANA | ************      | RJ     | 88668786 |
| GIOVANA | ************      | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM | ES     | 88965676 |
| EDUARDO | ************      | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM    | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM   | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM  | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 44522578 |
+---------+-------------------+--------+----------+

---------------------------------------

VIEW (ponteiro):  -- DDL

SELECT  C.IDCLIENTE AS ID, 
		C.NOME, 
		C.SEXO, 
		C.EMAIL,
		E.CIDADE, 
		E.BAIRRO, 
		E.ESTADO, 
		T.TIPO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

/* Se eu to tendo que usar isso o tempo todo preciso ficar escrevendo isso o tempo todo? 

Um bloco de notas com seus resumos/scripts/anotações é sempre bem vindo, mas tem outra maneira de ajudar: VIEW
View: nome que vc da pra alo que vc quer chamar */

CREATE VIEW RELATORIO AS
SELECT  C.IDCLIENTE AS ID, 
		C.NOME, 
		C.SEXO, 
		C.EMAIL,
		E.CIDADE, 
		E.BAIRRO, 
		E.ESTADO, 
		T.TIPO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


SELECT * FROM RELATORIO; -- MOSTRA TUDO QUE TA ALI DENTRO (Y)

/* 
SHOW DATABASES -- Bando de dados
SHOW TABLES -- Tabelas  >>> E VIEWS <<<
SHOW VIEWS; -- NÃO EXISTE

** View não duiplica os dados no banco. Ela é basicamente uma tabela virtual ** */


APAGANDO UMA VIEW: 

DROP VIEW RELATORIO;

/* PRA FICAR MAIS FÁCIL DE VISUALIZAR AS VIEWS USE UM PREFIXO: 
V_ nomedaVIEW */

CREATE VIEW V_RELATORIO AS
SELECT  C.IDCLIENTE AS ID, 
		C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL, '*********') AS 'EMAIL',
		E.CIDADE, 
		E.BAIRRO, 
		E.ESTADO, 
		T.TIPO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT * FROM V_RELATORIO;

/* Agora tudo que aparecer em 'show tables' e tiver V_ é uma VIEW */

IMPORTANTE: Usar uma view pode comprometer o desempenho das respostas, uma vez que vc vai ter que chamar a 
tabela (VIEW) que vem de outra tabela 
-- Vc monta sua tabela para ser puxada da tabela mãe, e isso leva um tempo, nem seja mínimo = efeito colateral



ESSE VIEW FAZ UMA JUNÇÃO DE TODAS AS TABELAS, ENTÃO EU POSSO USAR ELA PARA FAZER UMA PROJEÇÃO SEM FICAR USANDO
INNER JOIN :

SELECT NOME, NUMERO, ESTADO 
FROM V_RELATORIO;

/* IMPORTANTE: 
Usar o cógido dessa maneira:

SELECT NOME, NUMERO, ESTADO 
FROM V_RELATORIO;

NÃO DA ERRO. 

O número vai receber COMO ALIAS o estado.

CUIDADO PRA NÃO PASSAR DESPERCEBIDO */

OPERAÇÕES DE DML EM VIEW:

/* NÃO PERMITIDO: INSERT E DELETE
PERMITIDO: UPDATE */


INSERT INTO V_RELATORIO VALUES
	('ANDREIA','F','ANDREIA@UOL.COM.BR','CEL','873547864','CENTRO','VITORIA','ES');
DELETE FROM V_RELATORIO WHERE NOME = 'JORGE';

=
ERROR 1394 (HY000): Can >> not insert into join << view 'comercio.v_relatorio' without fields list
ERROR 1395 (HY000): Can not delete from join view 'comercio.v_relatorio'

/* não pode inserir e deletar informações de VIEWS que tem JOIN em sua composição (pq envolve mais de 1 tabela)
Se a VIEW NÃO tiver nenhum JOIN pode fazer deleções e inserções */

PORÉM: 
UPDATE V_RELATORIO SET NOME = 'JOSE' WHERE NOME = 'JORGE';  -- UPDATE FUNCIONA
-- nesse caso só mudou o nome, o resto das informações não (email)
** Se a VIEW tiver 2 colunas, e a tabela tiver 5, quando der update só será add 2 informações (e não as outras 3)

-- RESUMINDO: SE FOR PRA FICAR MODIFICANDO OS DADOS NÃO USE O VIEW

SELECT -- PRA ISSO QUE SERVE, USE SEM MODERAÇÃO


-------------------------------

ORDER BY -- ÚNICA MANEIRA DE ORDENAR UMA TABELA.


CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE'); 

SELECT * FROM ALUNOS
ORDER BY NUMERO;  -- ORDENA NUMERICAMENTE.

SELECT * FROM ALUNOS
ORDER BY 1;  -- NUMERO DA COLUNA, NESSE CASO É O NUMERO

SELECT * FROM ALUNOS
ORDER BY 2; -- NUMERO DA COLUNA, NESSE CASO É O NOME



/* ORDENANDO POR MAIS DE UMA COLUNA */

SELECT * FROM ALUNOS
ORDER BY 1; -- ORDENOU A PRIMEIRA COLUNA MAS A OUTRA FICOU ALEATÓRIA

SELECT * FROM ALUNOS
ORDER BY NUMERO, NOME;  -- ORDENOU A PRIMEIRA COLUNA E A SEGUNDA COLUNA

SELECT * FROM ALUNOS
ORDER BY 1, 2;  -- PODE USAR O NUMERO DA COLUNA PARA DESCREVER A ORDEM DE ORGANIZAÇÃO DAS COLUNAS.



/* MESCLANDO ORDER BY COM PROJECAO */

SELECT NOME FROM ALUNOS -- VC SÓ TA CHAMANDO 1 COLUNA ENTÃO NÃO TEM COMO ORDENAR 2 COLUNAS;
ORDER BY 1, 2;  -- PEDINDO PRA ORDENAR AS COLUNAS PELOS NÚMEROS DELAS. 


SELECT NOME FROM ALUNOS  -- NESSE CASO FUNCIONA PQ VC TA CHAMANDO O NOME DA COLUNA E NÃO A POSIÇÃO DELA
ORDER BY NUMERO, NOME; 



/* ORDER BY DESC / ASC */


SELECT * FROM ALUNOS
ORDER BY 1 ASC;  -- ASCENDENTE > (SE OMITIR ELE ENTENDE COMO ASC)

SELECT * FROM ALUNOS
ORDER BY 1 DESC;  -- DESCENDENTE <

SELECT * FROM ALUNOS
ORDER BY 1, 2 DESC; -- NUMERO ASC E NOME DESC (O desc vai só pro 2)

SELECT * FROM ALUNOS
ORDER BY 1 DESC, 2 DESC; -- NUMERO E NOME DESC



/* ORDENANDO COM JOINS */


SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'************') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1; -- NOMES EM ORDEN ASC


SELECT * FROM V_RELATORIO
ORDER BY 1; -- MESMA COISA DE CIMA.

-- SEMPRE SE UTILIZA POR ÚLTIMO. 

---------------------------------------
DELIMITADOR -- SEMPRE MUDAR QUANDO FOR PROGRAMAR COM SQL (ASSUNTO 4)

/*; = DELIMITADOR/DELIMITER padrão do SQL: O banco só executa quando ver o ;

As vezes */


STATUS /* COMANDO DE ESTRUTURA */: MOSTRA OS DADOS DO SQL 
"Using delimiter: ; " mostra qual é o delimitador que esta sendo usando. 
"Uptime: " Mostra o tempo que o banco esta aberto p

pra programar no banco tem que mudar o demiliter

DELIMITER $  -- MUDA o demiliter (agora o delimiter é $)

** CUIDADO COM ESPAÇOS E MUITO CARACTERES NA HORA DE ESTABELECER O DEMILITER! (VERSÕES ANTERIORES DO SQL ACEITAVA ESPAÇO COMO DELIMITER)
** FECHAR E ABRIR O BANCO FAZ VOLTAR O DELIMITER (;)


/* FUNÇÕES DE AGREGAÇÃO NUMÉRICAS */


CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL,'CARLOS','M',76234.78,88346.87,5756.90);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA','F',5865.78,6768.87,4467.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO','M',78769.78,6685.87,6664.90);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA','F',5779.78,446886.87,8965.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANDERSON','M',676545.78,77544.87,578665.90);
INSERT INTO VENDEDORES VALUES(NULL,'IVONE','F',57789.78,44774.87,68665.90);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO','M',4785.78,66478.87,6887.90);
INSERT INTO VENDEDORES VALUES(NULL,'CELIA','F',89667.78,57654.87,5755.90);


-- FUNÇÃO MAX/MIN/AVG - TRAZ O VALOR MÁXIMO, MÍNIMO E MÉDIO DE UMA COLUNA, RESPECTIVAMENTE.

SELECT MAX(FEVEREIRO) AS MAIOR_FEV 
FROM VENDEDORES;

SELECT MIN(FEVEREIRO) AS MENOR_FEV 
FROM VENDEDORES;


SELECT AVG(FEVEREIRO) AS MEDIA_FEV 
FROM VENDEDORES;

-- MISTURANDO AS FUNÇÕES

SELECT MAX(JANEIRO) AS MAX_JAN, 
	   MIN(JANEIRO) AS MIN_JAN,
	   AVG(JANEIRO) AS MEDIA_JAN
FROM VENDEDORES;

+-----------+---------+---------------+
| MAX_JAN   | MIN_JAN | MEDIA_JAN     |
+-----------+---------+---------------+
| 676545.75 | 4785.78 | 124429.901794 | <- MUITOS NÚMEROS
+-----------+---------+---------------+


-- FUNÇÃO TRUNCATE = TRUNCA VALORES REMOVE AS VÍRGULAS.
--TRUNCATE(O QUE VC VAI REDUZIR(FUNÇAO), NUM DE VIRGULAS)

SELECT MAX(JANEIRO) AS MAX_JAN, 
	   MIN(JANEIRO) AS MIN_JAN,
	   TRUNCATE(AVG(JANEIRO),2) AS MEDIA_JAN
FROM VENDEDORES;

+-----------+---------+-----------+
| MAX_JAN   | MIN_JAN | MEDIA_JAN |
+-----------+---------+-----------+
| 676545.75 | 4785.78 | 124429.90 | <- 2 NUM DPS DA VIRGULA
+-----------+---------+-----------+







