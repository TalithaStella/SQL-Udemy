/* PERFORMACE COM OPERADORES LÓGICOS 

PRA CONTAR: 
SELECT COUNT (*) FROM CLIENTE;

SELECT SEXO, COUNT (*) FROM CLIENTEGROUP BY SEXO;

SELECT CIDADE, COUNT (*) FROM CLIENTEGROUP BY CIDADE;

CONDICAO
SEXO =F
CIDADE = RJ

SITUACAO -  TRATANDO COM OU/OR 
70% M (F)
20% MORA NO RJ; 

COLOCAR O SEXO NA FRENTE, UMA VEZ QUE SÓ PRECISA DE 1 CONDICAO SER VDD E 70% JÁ VAI SER VDD, ASSIM TERÁ UMA RESPOSTA MAIS RÁPIDA. 
Se colocar a cidade na frente ele ainda vai ter que passar para próxima condição pra ver se as 2 são verdadeiras. 

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE SEXO = 'F'
OR CIDADE = 'RJ'

SITUACAO - TRATANDO COM E/ AND
70% MULHERES (F)
30 MORA NO RJ

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE CIDADE = 'RJ'
AND SEXO  = 'F'

COM AND A LÓGICA É CONTRÁRIA, UMA VEZ QUE POUCOS MORAM NO RJ, ENTÃO ELE VAI CHECAR A FALSA PRIMEIRO E NEM PASSA PRA SEGUNDA, GERANDO TAMBÉM UMA RESPOSTA MAIS RÁPIDA.
Se colocar primeiro o sexo (onde 70%) vai ser vdd ele vai ter que passar pra próxima parte pelo menos 40% a mais)


* ISSO SÓ É POSSÍVEL QUANDO VC CONHECE BEM OS SEUS DADOS


FAZER ANALISES DO BANCO EM HORÁRIO DE PICO 
(USAR O BANCO DE TESTES)

*/

