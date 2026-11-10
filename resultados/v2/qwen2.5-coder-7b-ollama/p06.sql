SELECT produto_base, SUM(quantidade) AS unidades
FROM itens
WHERE mes LIKE '2026-%'
GROUP BY produto_base
ORDER BY unidades DESC
LIMIT 1
