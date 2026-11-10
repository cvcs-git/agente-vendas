SELECT vendedor, SUM(quantidade) AS volume_vendas
FROM itens
WHERE mes = '2026-05'
GROUP BY vendedor
ORDER BY volume_vendas DESC
LIMIT 1
