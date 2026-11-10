SELECT produto_base, SUM(quantidade) AS unidades
FROM itens
GROUP BY produto_base
ORDER BY unidades DESC
LIMIT 1
