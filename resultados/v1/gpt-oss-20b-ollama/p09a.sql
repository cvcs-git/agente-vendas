SELECT vendedor, SUM(faturamento) AS faturamento
FROM pedidos_efetivos
WHERE strftime('%Y-%m', emissao) = '2026-05'
GROUP BY vendedor
ORDER BY faturamento DESC
LIMIT 1;
