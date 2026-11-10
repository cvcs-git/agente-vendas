SELECT strftime('%Y-%m', emissao) AS mes, SUM(faturamento) AS total_faturamento
FROM pedidos_efetivos
GROUP BY mes
ORDER BY total_faturamento DESC
LIMIT 1;
