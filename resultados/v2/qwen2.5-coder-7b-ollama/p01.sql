SELECT cliente, COUNT(*) AS pedidos
FROM pedidos_efetivos
WHERE mes = '2026-08'
GROUP BY cliente
ORDER BY pedidos DESC
LIMIT 1
