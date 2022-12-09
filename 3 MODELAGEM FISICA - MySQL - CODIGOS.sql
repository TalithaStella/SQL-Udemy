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


Hogwarts: 1/10 (250)
Easteros: 4/10 (340)
13º andar: 8/10 (290)
Torre: 81/100 (360)
Sombras -  Magma: 4/10 (298)
Tornado: 215/1000 (310)
Demoníaco: 9/10 (308)
Ídolos: 1/21 (222)


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


DROP TABLE = APAGA A TABELA; !!!
DROP DATABASE = APAGA O BANCO

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

-- AGREGANDO COM SUM() 


SELECT SUM(JANEIRO) AS TOTAL_JAN
FROM VENDEDORES;
-- SOMA TUDO QUE TAVA NA COLUNA E ME DEU O RESULTADO


SELECT SUM(JANEIRO) AS TOTAL_JAN,
	   SUM(FEVEREIRO) AS TOTAL_FEV,
	   SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;

+-----------+-----------+-----------+
| TOTAL_JAN | TOTAL_FEV | TOTAL_MAR |
+-----------+-----------+-----------+
| 995439.21 | 795141.96 | 685831.17 |
+-----------+-----------+-----------+


/* VENDAS POR SEXO */

SELECT SEXO, SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO;

+------+-------------+
| SEXO | TOTAL_MARCO |
+------+-------------+
| F    |    87855.60 |
| M    |   597975.57 |
+------+-------------+


NESSE CASO O COUNT(*) NÃO FUNCIONARIA PQ ELE SÓ FALA O 'NUMERO TOTAL DE LINHAS NA TABELA', O SUM VAI SOMAR OS VALORES DENTRO DA TABELA

SELECT COUNT(*), SEXO
FROM VENDEDORES 
GROUP BY SEXO;

+----------+------+
| COUNT(*) | SEXO |
+----------+------+
|        4 | F    |
|        4 | M    |
+----------+------+


/* SELECT SEXO, COUNT(MARCO), AS TOTAL_MARCO
FROM VENDEDORES 
GROUP BY SEXO;  -- ERROR 1064 (42000): You have an error in your SQL syntax; */




/* SUBQUERIES */

+------------+----------+------+-----------+-----------+-----------+
| IDVENDEDOR | NOME     | SEXO | JANEIRO   | FEVEREIRO | MARCO     |
+------------+----------+------+-----------+-----------+-----------+
|          1 | CARLOS   | M    |  76234.78 |  88346.87 |   5756.90 |
|          2 | MARIA    | F    |   5865.78 |   6768.87 |   4467.90 |<- MENOS
|          3 | ANTONIO  | M    |  78769.78 |   6685.87 |   6664.90 |
|          4 | CLARA    | F    |   5779.78 | 446886.88 |   8965.90 |
|          5 | ANDERSON | M    | 676545.75 |  77544.87 | 578665.88 |<- MAIS
|          6 | IVONE    | F    |  57789.78 |  44774.87 |  68665.90 |
|          7 | JOAO     | M    |   4785.78 |  66478.87 |   6887.90 |
|          8 | CELIA    | F    |  89667.78 |  57654.87 |   5755.90 |
+------------+----------+------+-----------+-----------+-----------+

-- VENDEDOR QUE VENDEU MENOS EM MARÇO E SEU NOME

SELECT MARCO AS VENDA, NOME
FROM VENDEDORES
WHERE MIN(MARCO); -- Invalid use of group function


SELECT MIN(MARCO) AS MENOR_VENDA FROM VENDEDORES;

-- ALTER QUERY 
SELECT MARCO AS MENOR_VENDA, NOME FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) AS MENOR_VENDA FROM VENDEDORES);
			 --INNER QUERY = É RESOLVIDA PRIMEIRO (TANTO QUE ESCREVI LA EM CIMA)

-- O RESULTADO DA INNER TEM QUE BATER COM A COLUNA QUE TA APLICANDO.
-- SE O WHERE TIVER VÁRIAS CONDIÇÕES A INNER TEM QUE TRAZER MAIS COLUNAS.


-- VENDEDOR QUE VENDEU MAIS EM MARÇO E SEU NOME

SELECT MAX(MARCO) AS MAIOR_VENDA, NOME 
FROM VENDEDORES;

+-------------+--------+
| MAIOR_VENDA | NOME   |
+-------------+--------+
|   578665.88 | CARLOS | - VALOR CERTO PESSOA ERRADA
+-------------+--------+

SELECT MAX(MARCO) AS MENOR_VENDA FROM VENDEDORES;

SELECT MARCO AS MENOR_VENDA, NOME FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) AS MENOR_VENDA FROM VENDEDORES);

+-------------+----------+
| MENOR_VENDA | NOME     |
+-------------+----------+
|   578665.88 | ANDERSON |
+-------------+----------+


-- VENDEDOR QUE VENDEU MAIS DO QUE A MÉDIA DO MÊS DE FEV E SEU NOME


SELECT TRUNCATE(AVG(FEVEREIRO),2) AS MEDIA_VENDA FROM VENDEDORES;
+-------------+
| MEDIA_VENDA |
+-------------+
|    99392.74 |
+-------------+

SELECT FEVEREIRO AS MAIOR_MEDIA, NOME FROM VENDEDORES
WHERE FEVEREIRO > (SELECT TRUNCATE(AVG(FEVEREIRO),2) AS MEDIA_VENDA FROM VENDEDORES);

+-------------+-------+
| MAIOR_MEDIA | NOME  |
+-------------+-------+
|   446886.88 | CLARA |
+-------------+-------+



/* OPERAÇÕES EM LINHA 

ATÉ ENTÃO ESTIVEMOS BUSCANDO VALORES QUE ESTAVAM DENTRO DAS COLUNAS, AGORA VAMOS PESQUISAR POR LINHAS


							 	 MEDIA JAN?	 MEDIA FEV   MEDIA MAR
								 MAX JAN?	 MAX FEV     MIN MAR
+------------+----------+------+-----------+-----------+-----------+
| IDVENDEDOR | NOME     | SEXO | JANEIRO   | FEVEREIRO | MARCO     |
+------------+----------+------+-----------+-----------+-----------+
|          1 | CARLOS   | M    |  76234.78 |  88346.87 |   5756.90 |
|          2 | MARIA    | F    |   5865.78 |   6768.87 |   4467.90 | <- QUAL FOI O TOTAL DA MARIA??
|          3 | ANTONIO  | M    |  78769.78 |   6685.87 |   6664.90 |
|          4 | CLARA    | F    |   5779.78 | 446886.88 |   8965.90 |
|          5 | ANDERSON | M    | 676545.75 |  77544.87 | 578665.88 | <- QUAL O TOTAL DO ANDERSON??
|          6 | IVONE    | F    |  57789.78 |  44774.87 |  68665.90 |
|          7 | JOAO     | M    |   4785.78 |  66478.87 |   6887.90 |
|          8 | CELIA    | F    |  89667.78 |  57654.87 |   5755.90 |
+------------+----------+------+-----------+-----------+-----------+

NESSE CASO PRECISAMOS DESSAS INFORMAÇÕES EM OUTRAS COLUNAS, MAS SEM ADICIONAR NOVAS COLUNAS AO BANCO, SOMENTE CRIANDO PROVISÓRIAMENTE

**** SE FAZ SEMPRE COM OPERAÇÕES ARITMÉTICAS!!!!
*/

SELECT NOME,
	   JANEIRO,
	   FEVEREIRO, 
	   MARCO, 
	   (JANEIRO+FEVEREIRO+MARCO) AS 'TOTAL', -- FIZ A COLUNA TOTAL SER ESSE CONJUNTO ()
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS 'MEDIA' -- FIZ A COLUNA MEDIA SER ESSE CONJUNTO () COM FUNCAO TRUNCATE
FROM VENDEDORES;

-- TALVEZ SEJA INTERESSANTE FAZER VIEWS DISSO.



+----------+-----------+-----------+-----------+------------+-----------+
| NOME     | JANEIRO   | FEVEREIRO | MARCO     | TOTAL      | MEDIA     |
+----------+-----------+-----------+-----------+------------+-----------+
| CARLOS   |  76234.78 |  88346.87 |   5756.90 |  170338.55 |  56779.51 |
| MARIA    |   5865.78 |   6768.87 |   4467.90 |   17102.55 |   5700.84 |
| ANTONIO  |  78769.78 |   6685.87 |   6664.90 |   92120.55 |  30706.85 |
| CLARA    |   5779.78 | 446886.88 |   8965.90 |  461632.56 | 153877.51 |
| ANDERSON | 676545.75 |  77544.87 | 578665.88 | 1332756.49 | 444252.16 |
| IVONE    |  57789.78 |  44774.87 |  68665.90 |  171230.55 |  57076.85 |
| JOAO     |   4785.78 |  66478.87 |   6887.90 |   78152.55 |  26050.84 |
| CELIA    |  89667.78 |  57654.87 |   5755.90 |  153078.55 |  51026.18 |
+----------+-----------+-----------+-----------+------------+-----------+


SELECT NOME,
	   JANEIRO,
	   FEVEREIRO, 
	   MARCO, 
	   (JANEIRO+FEVEREIRO+MARCO) AS 'TOTAL',
	   (JANEIRO+FEVEREIRO+MARCO) * .25 AS 'DESCONTO', 
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS 'MEDIA'
FROM VENDEDORES;


+----------+-----------+-----------+-----------+------------+-----------+-----------+
| NOME     | JANEIRO   | FEVEREIRO | MARCO     | TOTAL      | DESCONTO  | MEDIA     |
+----------+-----------+-----------+-----------+------------+-----------+-----------+
| CARLOS   |  76234.78 |  88346.87 |   5756.90 |  170338.55 |  42584.64 |  56779.51 |
| MARIA    |   5865.78 |   6768.87 |   4467.90 |   17102.55 |   4275.64 |   5700.84 |
| ANTONIO  |  78769.78 |   6685.87 |   6664.90 |   92120.55 |  23030.14 |  30706.85 |
| CLARA    |   5779.78 | 446886.88 |   8965.90 |  461632.56 | 115408.14 | 153877.51 |
| ANDERSON | 676545.75 |  77544.87 | 578665.88 | 1332756.49 | 333189.12 | 444252.16 |
| IVONE    |  57789.78 |  44774.87 |  68665.90 |  171230.55 |  42807.64 |  57076.85 |
| JOAO     |   4785.78 |  66478.87 |   6887.90 |   78152.55 |  19538.14 |  26050.84 |
| CELIA    |  89667.78 |  57654.87 |   5755.90 |  153078.55 |  38269.64 |  51026.18 |
+----------+-----------+-----------+-----------+------------+-----------+-----------+


CREATE VIEW V_RELATORIO_TDM AS
SELECT NOME,
	   JANEIRO,
	   FEVEREIRO, 
	   MARCO, 
	   (JANEIRO+FEVEREIRO+MARCO) AS 'TOTAL',
	   (JANEIRO+FEVEREIRO+MARCO) * .25 AS 'DESCONTO', 
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS 'MEDIA'
FROM VENDEDORES;


SELECT * FROM V_RELATORIO_TDM;


/* A33 - ALTERANDO TABELAS */

CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

CREATE TABLE TABELA(
	COLUNA1 INT PRIMARY KEY AUTO_INCREMENT
);

--ADICIONANDO UMA PK
ALTER TABLE TABELA 
ADD PRIMARY KEY (COLUNA1);

--ADICIONANDO COLUNA SEM POSICAO. ULTIMA POSICAO
ALTER TABLE TABELA 
ADD COLUNA varchar(30);

ALTER TABLE TABELA 
ADD COLUNA100 INT;

--ADICIONANDO UMA COLUNA COM POSICAO
ALTER TABLE TABELA 
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA3;

--MODIFICANDO O TIPO DE UM CAMPO
ALTER TABLE TABELA
 MODIFY COLUNA2 DATE NOT NULL;

--RENOMEANDO O NOME DA TABELA
ALTER TABLE TABELA 
RENAME PESSOA;

CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);

--Foreign key
ALTER TABLE TIME 
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);

/* VERIFICAR AS CHAVES */
SHOW CREATE TABLE TIME;


/* A34 - ORGANIZACAO DE CHAVES - CONSTRAINT (REGRA de integridade referencial) 
Vc só pode criar algo como FK se tiver uma PK para ser referência*/


CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);


/* Aparece um nome de constraint aleatório pq a gente não definiu uma, o que é considerado uma 'pratica ruim'.
Para nomear as constraints tem que criar as chaves e as constraint por fora da tabela (???) */

 /* Dicionário de dados: Mostra View, procedures, chaves e outras coisas que nos comantos aprendidos até agora ainda n aparece. Por isso é importante 
 colocar nome nas chaves */

INSERT INTO JOGADOR VALUES(NULL,'GUERRERO');
INSERT INTO TIMES VALUES(NULL,'FLAMENGO',1);

SHOW CREATE TABLE JOGADOR;
SHOW CREATE TABLE TIMES;



/* A35 - ORGANIZANDO CHAVES / ações de constraint */

SHOW TABLES;


*************ATUALIZAR ISSO NO MEU BD *******************


DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

-- Tem que apagar nessa ordem pq 'tem dependencia'

/* Outra razão para criar as chaves por fora: 
Se eu tenho 3 tabelas e uma tabela precisa referenciar a outra não da pra colocar um foreing key onde não tem uma primary key.

Então em ambiente de trabalho eu crio todas as tabelas: 
create table
create table
create table

E depois as ALTER TABLE com as constraint que eu preciso

ALTER TABLE
ALTER TABLE
ALTER TABLE

Fica melhor para outras pessoas que pegam o scrip conseguir entender melhor

 */

 /* Como fizemos a primeira vez:


 CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M', 'F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);  */

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE -- add constraint: add uma regra
PRIMARY KEY(IDCLIENTE);


-- NOME DA TABELA ADD CONSTRAINT NOMEDACONSTRAINT (FK_NOME DA ORIGEM/ONDE ESTA)
ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE --foreingkey_origem_destino 
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);
-- FK QUE SE INSTALA NA ID CORES E SE REFERE A TABLELA CORES(CAMPO ID CORES)

/* FK_CLIENTE_TELEFONE = SEI QUE TEM UMA TABELA CLIENTE, UMA TELEFONE E QUE A CLIENTE É 
A REFERÊNCIAL QUE SE REFERE AO TELEFONE

SHOW CREATE TABLE TELEFONE;

-- Agora quando vc da o show table o nome da constraint aparece como "FK_cliente_telefone"


/* DICIONARIO DE DADOS 

Como procurar coisas no dicionário de dados:
Guarda meta dado = dados dos dados
armazena os dados das tabelas e dos dados armazenados nelas

no SHOW DATABASES pararece alguns bancos que o SQL usa pra armazenar dados dele mesmo (USE INFORMATION_SCHEMA;)

*procurar constraint: Aparece como 'TABLE_CONSTRAINT'  */


SHOW DATABASES;

USE INFORMATION_SCHEMA; -- Onde estão as constraints

STATUS -- pra verqual banco esta sendo usado. 

SHOW TABLES; -- um monte de coisa

DESC TABLE_CONSTRAINTS; 

SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_NAME AS "NOME REGRA",
	   CONSTRAINT_TYPE AS "TIPO"
	   FROM TABLE_CONSTRAINTS
	   WHERE CONSTRAINT_SCHEMA = 'COMERCIO';



/* APAGANDO CONSTRAINTS 

as vezes precisa apagar, pq se precisa fazer 'update em massa(milhoes de dados novos)' ele vai ficar batendo 1 por 1 milhares de vezes
Pelo tempo de processamento vale apena apagar e depois criar dnv

Risco que pode acontecer: upar alguma coisa com a chave não compatível, aí vai dar erro. 

*/

USE COMERCIO;

ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);7

******************* FAZER O EXERCÍCIO SEÇÃO 18 *******************


/* Triggers */

CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH RUN -- PARA CADA LINHA
BEGIN 

	COMANDO SQL -- BLOCO DE PROGRAMAÇÃO (>> ; <<)

END 
-- $ NÃO ESQUECER DE MUDAR O DELIMITADOR

***LINUX É CASE SENSITIVE ENTÃO DIFERENCIA DE MAIUSCULA DE MINUSCULA

CREATE DATABASE AULA40;

USE AULA40;

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)
);

CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)
);

/* CRIANDO A TRIGGER */



/* 
A trigger por ser condicionada antes ou depois de um insert, delete, e update (ou seja 6 momentos diferentes: BEFORE INSERT, AFTER INSERT, BEFORE DELETE, AFTER DELETE, 
BEFORE UPDATE, AFTER UPDATE)

MAS ela não pode ser condicionada em 2 momentos iguais na mesma tabela (antes de um insert 2 vezes em uma mesma tabela --> TRIGGER 1 BEFORE UPDATE, E TRIGGER 2
BEFORE UPDATE)
*/

NEW / OLD 

INSERT = NEW
DELETE = OLD
UPDATE = O QUE ENTRA (NEW) O QUE SAI (OLD)


DELIMITER $

-- TRIGGER PARA BACKUP DE USUARIO DELETADO


CREATE TRIGGER BACKUP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW 
BEGIN
		
	INSERT INTO BKP_USUARIO VALUES
	(NULL /*HARD CODE PQ O IDBACKUP É AUTOINCREMENT */, OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN); 
	/*OLD pq tem que ser antes de deletar(ou seja um valor que já está na tabela) */
END
$

Aula 82, em 13 min.

/* SOBRE BACKUP: 

A opção acima foi fazer backup de uma informação adicionando em uma outra tabela (BKP_UDUARIO), mas podemos usar outros
meios de backup, como um outro hardware (SSD/HD) ou de um banco para outro através de trigger.

BACKUP EM BANCO DE DADOS (SEJA EM OUTRO BANCO OU EM OUTRA TABELA) = LÓGICO
BACK UP EM OUTRAS EXTENSÕES (.BKP) = FÍSICO
 

 -- Comunicação entre bancos

Criar um banco de BACKUPs além do banco de trabalho
*/

CREATE DATABASE LOJA; -- Banco do cliente

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

STATUS 

CREATE DATABASE BACKUP; -- Criação de banco só pra backup

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

USE LOJA; -- Voltar para o banco de trabalho

-- BANCO.ESCHEMA.TABELA = comunicação entre tabelas

	INSERT INTO BACKUP.BKP_PRODUTO VALUES (NULL, 1000, 'TESTE', 0.0); -- ESSE INSERT NÃO CONSEGUE SE COMUNICAR ENTRE TABELAS

SELECT * FROM BACKUP.BKP_PRODUTO;

DELIMITER $

-- NOTE QUE A TRIGGER É CRIADA NO BANCO DE TRABALHO!!!

--TRIGGER QUE SALVA TUDO QUE FOI INSERIDO
CREATE TRIGGER BACKUP_PRODUTO
BEFORE INSERT ON PRODUTO
FOR EACH ROW
BEGIN 
	INSERT INTO BACKUP.BKP_PRODUTO VALUES (NULL, NEW.IDPRODUTO, NEW.NOME, NEW.VALOR);  
	--TEM QUE COLOCAR O INSERT ACIMA DENTRO DA TRIGGER PRA TER COMUNICAÇÃO. TEM QUE COLOCAR NEW (BEFORE). NOME DE CADA COLUNA DA TABELA

END
$

DELIMITER ;

-- INSERIR OS DADOS NO BANCO NORMALMENTE: 

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO BI',80.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO ORACLE',70.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL SERVER',100.00);


SELECT * FROM PRODUTO;

+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         2 | LIVRO BI         |  80.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
+-----------+------------------+--------+



SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  |
+-------+-----------+------------------+--------+
|     1 |         0 | LIVRO MODELAGEM  |  50.00 |
|     2 |         0 | LIVRO BI         |  80.00 |
|     3 |         0 | LIVRO ORACLE     |  70.00 |
|     4 |         0 | LIVRO SQL SERVER | 100.00 |
+-------+-----------+------------------+--------+


DELIMITER $

--TRIGGER QUE SALVA TUDO QUE FOR APAGADO 
CREATE TRIGGER BACKUP_PRODUTO_DEL -- COLOCA O NOME COM A FUNÇÃO DA TRIGGER
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN 
	INSERT INTO BACKUP.BKP_PRODUTO VALUES (NULL, OLD.IDPRODUTO, OLD.NOME, OLD.VALOR);  
	
END
$

DELIMITER ;

DELETE FROM PRODUTO WHERE IDPRODUTO = 2;

SELECT * FROM PRODUTO;

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  |
+-------+-----------+------------------+--------+
|     1 |         0 | LIVRO MODELAGEM  |  50.00 |
|     2 |         0 | LIVRO BI         |  80.00 |
|     3 |         0 | LIVRO ORACLE     |  70.00 |
|     4 |         0 | LIVRO SQL SERVER | 100.00 |
|     5 |         2 | LIVRO BI         |  80.00 | <-
+-------+-----------+------------------+--------+


/* Quando faz a trigger antes de inserir ele não recebe número de ID, pq é um campo auto_increment (dado só é gravado
depois de ser inserida na tabela). Então quando for fazer esse tipo de armazenamento usar 'AFTER' INSERT. 
A triggger de delete como é old já consegue pegar o dado. */

DROP TRIGGER BACKUP_PRODUTO;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN 
	INSERT INTO BACKUP.BKP_PRODUTO VALUES (NULL, NEW.IDPRODUTO, NEW.NOME, NEW.VALOR);  
	
END
$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO C#',100.00);

SELECT * FROM PRODUTO;

+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
|         5 | LIVRO C#         | 100.00 |
+-----------+------------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  |
+-------+-----------+------------------+--------+
|     1 |         0 | LIVRO MODELAGEM  |  50.00 |
|     2 |         0 | LIVRO BI         |  80.00 |
|     3 |         0 | LIVRO ORACLE     |  70.00 |
|     4 |         0 | LIVRO SQL SERVER | 100.00 |
|     5 |         2 | LIVRO BI         |  80.00 |
|     6 |         5 | LIVRO C#         | 100.00 | <<< AGORA TEM O ID PRODUTO PQ USOU AFTER (OU SEJA, DPS DE REGISTRADO)
+-------+-----------+------------------+--------+


/* Mas ainda assim, da maneira que está não dá pra saber quais são os valores adicionados no momento de INSERT ou de DELETE. */

ALTER TABLE  BACKUP.BKP_PRODUTO
ADD EVENTO CHAR (1) -- ADD TABELA EVENTO



DROP TRIGGER BACKUP_PRODUTO_DEL; -- Apaga a trigger pra add o campo 'EVENTO' 


DELIMITER $


CREATE TRIGGER BACKUP_PRODUTO_DEL 
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN 
	INSERT INTO BACKUP.BKP_PRODUTO VALUES (NULL, OLD.IDPRODUTO, OLD.NOME, OLD.VALOR, 'D');  
	
END
$

DELIMITER ;

DELETE FROM PRODUTO WHERE ID PRODUTO = 4;

SELECT * FROM BACKUP.BKP_PRODUTO;

***** ADD TABELA NO MEU BD EM CASA *****

-- ADD A COLUNA PRA DISTINGUIR O INSERT


DROP TRIGGER BACKUP_PRODUTO; -- Apaga a trigger pra add o campo 'EVENTO' 


DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN 
	INSERT INTO BACKUP.BKP_PRODUTO VALUES (NULL, NEW.IDPRODUTO, NEW.NOME, NEW.VALOR, 'I');  
	
END
$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'NOVO LIVRO', 10.00);

SELECT * FROM PRODUTO;



-- TRIGGER DE UPDATE

/* Quando foi deletado, alterado, e gravar a alteração*/ 

DELETAR AS 2 DB CRIADAS 

DROP DATABASE LOJA;

DROP DATABASE BACKUP;

CREATE DATABASE LOJA;

USE LOJA;



CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);



/* CONCEITINHOS: 
SELECT NOW (); -> Mostra a data e a hora

SELECT CURRENT USER (); -- Mostra quem ta logado e o servidor local. 

Nessa trigger ele quer saber quem fez a alteração e a hora que foi feita: 

Quando: 
SELECT NOW ();

Quem:
SELECT CURRENT USER ();
*/


CREATE DATABASE BACKUP;

USE BACKUP; -- Alterações na tabela BACKUP

CREATE TABLE BKP_PRODUTO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,  -- N pode ser primarykey (Se o produto sofrer mais de 1 alteração, n vai dar pra add)
	NOME VARCHAR(30),
	VALOR_ORIGINAL FLOAT(10,2),
	VALOR_ALTERADO FLOAT(10,2),
	DATA DATETIME,
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
);


USE LOJA;  -- VOLTAMOS PRA TABELA DE TRABALHO


INSERT INTO PRODUTO VALUES(NULL, 'LIVRO MODELAGEM', 50.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO BI', 80.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO ORACLE', 70.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO SQL SERVER', 100.00);


SELECT * FROM PRODUTO;

DELIMITER $

CREATE TRIGGER AUDIT_PROD_U
AFTER UPDATE ON BKP_PRODUTO
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTO VALUES
	(NULL, OLD.IDPRODUTO, OLD.NOME, OLD.VALOR, NEW.VALOR, NOW(), CURRENT_USER(), 'U');
END

DELIMITER ;


UPDATE PRODUTO SET VALOR = 110.00
WHERE IDPRODUTO = 4;


SELECT * FROM PRODUTO;

SELECT * FROM BACKUP.BKP_PRODUTO; 


***** ADICIONAR A TRIGGER DE DELETE E INSERT NESSE CENÁRIO *****
*** TESTAR *** -- QQ COISA APAGA TUDO E FAZ DNV ZZZZZ

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_I
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN 
	INSERT INTO BACKUP.BKP_PRODUTO VALUES 
	(NULL, NEW.IDPRODUTO, NEW.NOME, NEW.VALOR, NOW(), CURRENT_USER(), 'I');  
	
END
$


CREATE TRIGGER BACKUP_PRODUTO_D
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN 
	INSERT INTO BACKUP.BKP_PRODUTO VALUES 
	(NULL, OLD.IDPRODUTO, OLD.NOME, OLD.VALOR, NOW(), CURRENT_USER, 'D');  
	
END
$

DELIMITER ;


***** AULA AUTORELACIONAMENTO - MODELAGEM (AULA 86)

/* 
As vezes vc precisa fazer o banco se relacionar com ele mesmo. 
Por exemplo: 

Para fazer um curso é necessário preeencher requisitos. 
Tabela 1: cursos
tabela 2: pre-requisitos da tabela 1
tabela 3: pre-requisito da tabela 2

Pra não ficar confuso é só fazer um AUTORELACIONAMENTO, onde o prérequisito já vai ser uma informação da própria tabela
*/


CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	HORAS INT,
	VALOR FLOAT(10,2),
	ID_PREREQ INT
);

/* É possível deixar campos com informações nulas add 
INSERT INTO CURSOS VALUES(1, 'pre-req', 0, 00.00, NULL); 

aí se tiver um curso sem requisito vc pode chamar ele por '1' que já tem os valores nulos. 
INSERT INTO CURSOS VALUES(NULL, 'BUSINESS INTELLIGENCE', 40, 800.00, 1); -- Aí esse curso chamando o 1 seria sem quisito
mas n foi o caso usado no exemplo abaixo. 

*/


ALTER TABLE CURSOS ADD CONSTRAINT FK_PREREQ
FOREIGN KEY(ID_PREREQ) REFERENCES CURSOS(IDCURSO);

INSERT INTO CURSOS VALUES(NULL, 'BD RELACIONAL', 20, 400.00, NULL);
INSERT INTO CURSOS VALUES(NULL, 'BUSINESS INTELLIGENCE', 40, 800.00, 1);
INSERT INTO CURSOS VALUES(NULL, 'RELATORIOS AVANCADOS', 20, 600.00, 2);
INSERT INTO CURSOS VALUES(NULL, 'LOGICA PROGRAM', 20, 400.00, NULL);
INSERT INTO CURSOS VALUES(NULL, 'RUBY', 30, 500.00, 4);

SELECT * FROM CURSOS;

SELECT NOME, VALOR, HORAS, IFNULL(ID_PREREQ,"SEM REQ") REQUISITO
FROM CURSOS;

/* NOME, VALOR, HORAS E O NOME DO PRE REQUISITO DO CURSO */



SELECT 
C.NOME AS CURSO, 
C.VALOR AS VALOR, 
C.HORAS AS CARGA, 
IFNULL(P.NOME, "---") AS PREREQ
FROM CURSOS C LEFT JOIN CURSOS P
ON P.IDCURSO = C.ID_PREREQ;


# APAGAR testando commit













