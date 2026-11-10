SELECT cliente, SUM(faturamento) AS total_faturamento
FROM pedidos_efetivos
GROUP BY cliente
ORDER BY total_faturamento DESC
LIMIT 1;
