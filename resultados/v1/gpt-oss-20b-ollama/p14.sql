WITH client_totals AS (
  SELECT cliente, SUM(faturamento) AS total
  FROM pedidos_efetivos
  GROUP BY cliente
),
cumulative AS (
  SELECT cliente, total,
         SUM(total) OVER (ORDER BY total DESC) AS cum_total
  FROM client_totals
),
threshold AS (
  SELECT MAX(cum_total) AS cum_80
  FROM cumulative
  WHERE cum_total <= 0.8 * (SELECT SUM(faturamento) FROM pedidos_efetivos)
)
SELECT COUNT(*) AS num_clients
FROM cumulative
WHERE cum_total <= (SELECT cum_80 FROM threshold);
