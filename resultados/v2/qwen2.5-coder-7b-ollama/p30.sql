SELECT mes, ROUND(SUM(faturamento), 2) AS faturamento
FROM itens
WHERE cliente LIKE '%beta%' OR nome_fantasia LIKE '%beta%'
GROUP BY mes
HAVING faturamento > (SELECT AVG(faturamento) FROM itens WHERE cliente LIKE '%beta%' OR nome_fantasia LIKE '%beta%')
