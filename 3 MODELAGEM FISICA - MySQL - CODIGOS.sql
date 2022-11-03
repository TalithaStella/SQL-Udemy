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

/* COMMIT E ROLL BACK */ 




