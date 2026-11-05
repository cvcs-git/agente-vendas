SELECT cliente, MAX(mes) AS ultimo_mes FROM itens WHERE (cliente LIKE '%delta%'
OR nome_fantasia LIKE '%delta%') AND tipo = 'venda' AND descricao LIKE '%tampa%'
AND descricao LIKE '%preta%' GROUP BY cliente
