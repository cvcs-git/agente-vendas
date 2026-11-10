SELECT SUM(faturamento) AS faturamento_acumulado, cliente
FROM itens
GROUP BY cliente
ORDER BY faturamento_acumulado DESC
LIMIT 1
