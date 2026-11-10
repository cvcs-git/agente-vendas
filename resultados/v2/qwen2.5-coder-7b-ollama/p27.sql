SELECT cliente, produto_base, SUM(quantidade) AS unidades
FROM itens
WHERE mes = '2026-08'
GROUP BY cliente, produto_base
ORDER BY cliente, unidades DESC
