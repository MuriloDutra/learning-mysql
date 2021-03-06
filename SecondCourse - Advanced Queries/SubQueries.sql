USE sucos_vendas;

SELECT DISTINCT bairro FROM tabela_de_vendedores;

SELECT * FROM tabela_de_clientes WHERE BAIRRO IN (SELECT DISTINCT bairro FROM tabela_de_vendedores);

SELECT A.EMBALAGEM, A.PRECO_MAXIMO FROM
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos GROUP BY EMBALAGEM) A
WHERE A.PRECO_MAXIMO >= 10;

SELECT CPF, COUNT(*) FROM notas_fiscais WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF HAVING COUNT(*) > 2000;

SELECT A.CPF, COUNT(*) FROM 
(SELECT * FROM notas_fiscais WHERE YEAR(data_venda) = 2016) A
 GROUP BY A.CPF HAVING COUNT(*) > 2000;

SELECT X.CPF, X.CONTADOR FROM 
(SELECT CPF, COUNT(*) AS CONTADOR FROM notas_fiscais WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CPF) X
WHERE X.CONTADOR > 2000
