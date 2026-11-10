SELECT ROUND(SUM(faturamento) / (SELECT SUM(faturamento) FROM pedidos_efetivos WHERE mes BETWEEN '2026-01' AND '2026-06') * 100, 1) AS participacao
FROM pedidos_efetivos
WHERE vendedor = 'Vendedor B' AND mes BETWEEN '2026-01' AND '2026-06'
