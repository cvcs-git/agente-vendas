SELECT vendedor, ROUND(SUM(faturamento), 2) AS faturamento
FROM itens
WHERE mes = '2026-05'
GROUP BY vendedor
ORDER BY faturamento DESC
LIMIT 1
