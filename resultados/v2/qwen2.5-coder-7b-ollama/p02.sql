SELECT produto_base, SUM(quantidade) AS unidades
FROM itens
WHERE mes = '2026-08'
GROUP BY produto_base
ORDER BY unidades DESC
LIMIT 1
