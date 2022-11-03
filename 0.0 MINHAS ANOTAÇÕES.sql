/* MINHAS ANOTAÇÕES/ATALHOS:*/

/* DIVERSOS: */

SHOW DATABASES; -- Mostra todas as tabelas
USE nomedatabela -- Muda a tabela que vc esta usando
DESC nomedatabela -- Mostra a tabela e os valores dos campos
COUNT (*): -- SELECT COUNT(*), departamento FROM FUNCIONARIOS group by departamento ORDER BY 1;

----------------------------

CATEGORIA DML DATA MANIPULATION LANGUAGE (manipulação):
	INSERT/ SELECT/ WHERE/ DELETE


/* INSERT */


INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM nomedatabela -- Mostra todos os dados registrados naquela tabela

/* FILTROS */

SELECT * FROM nomedatabela
WHERE SEXO = 'M'; 

/* UPDATE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;  -- filtro procurando pelo ID do cliente (chave ÚNICA de cada cliente.) para dar update

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;  -- Depois que conferiu acima se é o dado certo, pode dar update

/* DELETE */ 

INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;  -- SEMPRE conferir se é o dado que vc esta procurando para não apagar outras coisas sem querer

DELETE FROM CLIENTE WHERE IDCLIENTE = 8; -- Depois de conferir, pode apagar.

---------------------------

 CATEGORIA DDL - DATA DEFINITION LANGUAGE (definição/tipagem)
	Quando vc vai criar a tabela e define os tipos de campos é uma DDL


/* ALTER TABLE */

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* MODIFY - ALTERANDO O TIPO */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;


*** Quando perceber que vc esqueceu alguma coisa na tabela é melhor criar uma nova (DROP TABLE) do que ficar
remendando *** 

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;
-- Dados adicionados vão para o final da tabela -- 

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */
-- Não é mto relevante uma vez que vc especifica a ordem que vc projeta quando usa select

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;


/* CRIANDO NOVO BD: */


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
	FOREIGN KEY (ID_CLIENTE) -- AQUI NÃO PODE IR VIRGULA (??)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE (
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM ('RES', 'COM', 'CEL') NOT NULL, 
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

/* MANEIRAS DE INSETIR DADOS: */


INSERT INTO CLIENTE VALUES 
	('ANA', 'F', 'ANA@GMAIL.COM', 85548962, '548556985', 'PRES ANTONIO - CENTRO - sp'),
	('CARLA', 'F', 'CARLA@GMAIL.COM', 7745828, '66587458', 'SAMUEL SILVA - CENTRO - mg');

INSERT INTO CLIENTE (IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES 
	(NULL, 'CARLOS', 'M', 'CARLOS@GMAIL.COM', '14774489756745'),
	(NULL, 'ANA', 'F', 'ANA@GMAIL.COM', '78945632145');


