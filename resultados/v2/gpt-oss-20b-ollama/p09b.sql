SELECT vendedor, SUM(quantidade) AS volume
FROM itens
WHERE mes = '2026-05'
GROUP BY vendedor
ORDER BY volume DESC
LIMIT 1;
