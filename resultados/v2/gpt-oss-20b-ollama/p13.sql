WITH q1 AS (
  SELECT cliente, SUM(faturamento) AS faturamento
  FROM itens
  WHERE mes BETWEEN '2026-01' AND '2026-03'
  GROUP BY cliente
),
q2 AS (
  SELECT cliente, SUM(faturamento) AS faturamento
  FROM itens
  WHERE mes BETWEEN '2026-04' AND '2026-06'
  GROUP BY cliente
)
SELECT
  q1.cliente,
  ROUND((q2.faturamento - q1.faturamento) / q1.faturamento * 100, 1) AS percent_change
FROM q1
JOIN q2 ON q1.cliente = q2.cliente
WHERE q1.faturamento <> 0
ORDER BY percent_change DESC;
