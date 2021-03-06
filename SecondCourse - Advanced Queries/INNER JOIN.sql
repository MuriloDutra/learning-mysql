USE sucos_vendas;

SELECT * FROM tabela_de_vendedores;
SELECT * FROM notas_fiscais;
SELECT * FROM itens_notas_fiscais;

SELECT * FROM tabela_de_vendedores VENDEDOR INNER JOIN notas_fiscais NOTAS ON VENDEDOR.MATRICULA = NOTAS.MATRICULA;

SELECT VENDEDOR.NOME, NOTAS.NUMERO FROM tabela_de_vendedores VENDEDOR
INNER JOIN notas_fiscais NOTAS
ON VENDEDOR.MATRICULA = NOTAS.MATRICULA;

SELECT CLIENTES.NOME, NOTAS.CPF, COUNT(*) AS QUANTIDADE_DE_NOTAS FROM notas_fiscais NOTAS
INNER JOIN tabela_de_clientes CLIENTES ON NOTAS.cpf = CLIENTES.cpf GROUP BY cpf;

SELECT CLIENTE.CPF, CLIENTE.NOME FROM tabela_de_clientes CLIENTE
INNER JOIN notas_fiscais NOTAS ON CLIENTE.CPF = NOTAS.CPF GROUP BY cpf;

SELECT DISTINCT CLIENTE.CPF, CLIENTE.NOME FROM tabela_de_clientes CLIENTE
INNER JOIN notas_fiscais NOTAS ON CLIENTE.CPF = NOTAS.CPF;

SELECT VENDEDORES.NOME, VENDEDORES.MATRICULA, COUNT(*) AS NUMERO_DE_VENDAS FROM tabela_de_vendedores VENDEDORES
INNER JOIN notas_fiscais NOTAS ON VENDEDORES.MATRICULA = NOTAS.MATRICULA GROUP BY VENDEDORES.NOME, VENDEDORES.MATRICULA;

SELECT YEAR(NOTAS.DATA_VENDA), FORMAT(SUM(ITENS.quantidade * ITENS.preco), 2) AS FATURAMENTO_ANUAL FROM itens_notas_fiscais AS ITENS
INNER JOIN notas_fiscais AS NOTAS ON NOTAS.NUMERO = ITENS.NUMERO GROUP BY YEAR(NOTAS.DATA_VENDA);

SELECT 
	VENDEDOR.NOME AS VENDEDOR,
	VENDEDOR.BAIRRO AS VENDEDOR_BAIRRO,
    CLIENTE.NOME AS CLIENTE,
    CLIENTE.BAIRRO AS CLIENTE_BAIRRO
FROM tabela_de_vendedores VENDEDOR
INNER JOIN tabela_de_clientes CLIENTE ON CLIENTE.BAIRRO = VENDEDOR.BAIRRO;

SELECT
	VENDEDOR.NOME AS VENDEDOR,
    VENDEDOR.BAIRRO AS VENDEDOR_BAIRRO,
    VENDEDOR.DE_FERIAS,
    CLIENTE.NOME AS CLIENTE,
    CLIENTE.BAIRRO CLIENTE_BAIRRO
FROM tabela_de_vendedores VENDEDOR
INNER JOIN tabela_de_clientes CLIENTE ON CLIENTE.BAIRRO = VENDEDOR.BAIRRO;

SELECT * FROM notas_fiscais;
SELECT * FROM itens_notas_fiscais;

SELECT (item.PRECO * item.QUANTIDADE) AS PRECO_FINAL FROM itens_notas_fiscais item
INNER JOIN tabela_de_produtos produto ON produto.CODIGO_DO_PRODUTO = item.CODIGO_DO_PRODUTO
GROUP BY produto.CODIGO_DO_PRODUTO;

SELECT YEAR(nf.DATA_VENDA) AS ANO, SUM(inf.QUANTIDADE * inf.PRECO) AS FATURAMENTO
FROM notas_fiscais nf INNER JOIN itens_notas_fiscais inf 
ON nf.NUMERO = inf.NUMERO
GROUP BY YEAR(DATA_VENDA);

SELECT customer.CPF, customer.NOME, nota.CPF FROM tabela_de_clientes customer
INNER JOIN notas_fiscais nota ON customer.cpf = nota.cpf;

SELECT DISTINCT customer.CPF, customer.NOME, nota.CPF FROM tabela_de_clientes customer
INNER JOIN notas_fiscais nota ON customer.cpf = nota.cpf;

SELECT customer.CPF, customer.NOME, nota.CPF FROM tabela_de_clientes customer
INNER JOIN notas_fiscais nota ON customer.cpf = nota.cpf GROUP BY customer.cpf;
