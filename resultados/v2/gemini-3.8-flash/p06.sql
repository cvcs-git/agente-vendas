SELECT codigo_produto, descricao, SUM(quantidade) AS unidades
FROM itens
WHERE mes LIKE '2026-%'
GROUP BY codigo_produto
ORDER BY unidades DESC
LIMIT 1