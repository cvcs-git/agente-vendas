SELECT cliente, AVG(julianday(p2.emissao) - julianday(p1.emissao)) AS media_dias, COUNT(*) AS intervalos
FROM pedidos_efetivos p1
JOIN pedidos_efetivos p2 ON p1.cliente = p2.cliente AND p1.pedido < p2.pedido
GROUP BY cliente
ORDER BY media_dias ASC, intervalos DESC
