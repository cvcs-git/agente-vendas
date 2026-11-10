WITH monthly AS (
  SELECT strftime('%Y-%m', emissao) AS month,
         SUM(faturamento) AS total
  FROM pedidos_efetivos
  WHERE cliente LIKE '%Beta%'
  GROUP BY month
),
avg_monthly AS (
  SELECT AVG(total) AS avg_total FROM monthly
)
SELECT month
FROM monthly, avg_monthly
WHERE total > avg_total
ORDER BY month;
