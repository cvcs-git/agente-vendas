SELECT cliente, ROUND(SUM(faturamento), 2) AS faturamento, ROUND(SUM(faturamento) * 100 / (SELECT SUM(faturamento) FROM itens), 1) AS percentual
FROM itens
GROUP BY cliente
ORDER BY faturamento DESC
LIMIT 1
