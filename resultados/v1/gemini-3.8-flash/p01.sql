SELECT cliente, COUNT(*) AS total_pedidos
FROM pedidos_efetivos
WHERE strftime('%Y-%m', emissao) = '2026-08'
GROUP BY cliente
ORDER BY total_pedidos DESC
LIMIT 1;