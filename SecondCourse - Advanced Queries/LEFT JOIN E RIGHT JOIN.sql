USE sucos_vendas;

SELECT COUNT(*) AS QUANTIDADE_DE_CLIENTES FROM tabela_de_clientes;

SELECT cpf, COUNT(*) FROM notas_fiscais GROUP BY cpf;

SELECT CLIENTE.NOME FROM tabela_de_clientes CLIENTE
LEFT JOIN notas_fiscais NOTAS ON NOTAS.CPF = CLIENTE.CPF GROUP BY CLIENTE.CPF;

SELECT CLIENTE.NOME, NOTAS.CPF FROM tabela_de_clientes CLIENTE
LEFT JOIN notas_fiscais NOTAS ON NOTAS.CPF = CLIENTE.CPF GROUP BY CLIENTE.CPF;

SELECT CLIENTE.NOME, NOTAS.CPF FROM tabela_de_clientes CLIENTE
LEFT JOIN notas_fiscais NOTAS ON NOTAS.CPF = CLIENTE.CPF WHERE NOTAS.CPF IS NULL GROUP BY CLIENTE.CPF;

SELECT CLIENTE.NOME, NOTAS.CPF FROM tabela_de_clientes CLIENTE
LEFT JOIN notas_fiscais NOTAS ON NOTAS.CPF = CLIENTE.CPF
WHERE NOTAS.CPF IS NULL
GROUP BY CLIENTE.CPF;

SELECT CLIENTE.NOME, NOTAS.CPF FROM tabela_de_clientes CLIENTE
LEFT JOIN notas_fiscais NOTAS ON NOTAS.CPF = CLIENTE.CPF
WHERE NOTAS.CPF IS NULL AND YEAR(NOTAS.DATA_VENDA) = 2015
GROUP BY CLIENTE.CPF;

SELECT CLIENTE.NOME, NOTAS.CPF FROM notas_fiscais NOTAS
RIGHT JOIN tabela_de_clientes CLIENTE ON CLIENTE.CPF = NOTAS.CPF GROUP BY NOTAS.CPF;

SELECT VENDEDOR.BAIRRO AS VENDEDOR_BAIRRO, CLIENTE.BAIRRO AS CLIENTE_BAIRRO FROM tabela_de_vendedores VENDEDOR
LEFT JOIN tabela_de_clientes CLIENTE ON VENDEDOR.BAIRRO = CLIENTE.BAIRRO GROUP BY VENDEDOR.matricula;

SELECT VENDEDOR.BAIRRO AS VENDEDOR_BAIRRO, CLIENTE.BAIRRO AS CLIENTE_BAIRRO FROM tabela_de_vendedores VENDEDOR
RIGHT JOIN tabela_de_clientes CLIENTE ON VENDEDOR.BAIRRO = CLIENTE.BAIRRO GROUP BY CLIENTE.CPF;

SELECT customer.nome, customer.cpf, nota.cpf FROM tabela_de_clientes customer
LEFT JOIN notas_fiscais nota ON customer.cpf = nota.cpf GROUP BY customer.cpf;

SELECT customer.nome, customer.cpf, nota.cpf AS CPF_NA_NOTA FROM tabela_de_clientes customer
LEFT JOIN notas_fiscais nota ON customer.cpf = nota.cpf WHERE nota.cpf IS NULL
GROUP BY customer.cpf;


SELECT customer.nome, customer.cpf, nota.cpf AS CPF_NA_NOTA FROM tabela_de_clientes customer
LEFT JOIN notas_fiscais nota ON customer.cpf = nota.cpf WHERE nota.cpf IS NULL
AND YEAER(nota.DATA_VENDA) = 2015 GROUP BY customer.cpf;

SELECT customer.nome, customer.cpf, nota.cpf FROM tabela_de_clientes customer
RIGHT JOIN notas_fiscais nota ON customer.cpf = nota.cpf GROUP BY customer.cpf;
