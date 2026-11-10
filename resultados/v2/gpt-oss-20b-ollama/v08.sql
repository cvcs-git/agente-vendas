WITH total_orders AS (
  SELECT cliente, COUNT(*) AS total
  FROM pedidos_efetivos
  WHERE mes LIKE '2026-%'
  GROUP BY cliente
),
canceled_orders AS (
  SELECT cliente, COUNT(DISTINCT pedido) AS canceled
  FROM itens
  WHERE tipo = 'cancelamento' AND mes LIKE '2026-%'
  GROUP BY cliente
)
SELECT t.cliente,
       ROUND(100.0 * COALESCE(c.canceled,0) / t.total, 1) AS percent_cancelado
FROM total_orders t
LEFT JOIN canceled_orders c ON t.cliente = c.cliente
ORDER BY percent_cancelado DESC
LIMIT 1;
