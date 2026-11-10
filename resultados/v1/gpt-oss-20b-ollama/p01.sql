SELECT cliente, COUNT(DISTINCT pedido) AS num_pedidos
FROM pedidos_efetivos
WHERE strftime('%Y-%m', emissao) = '2026-08'
GROUP BY cliente
ORDER BY num_pedidos DESC
LIMIT 1;
