WITH client_fat AS (
  SELECT cliente, SUM(faturamento) AS faturamento
  FROM itens
  GROUP BY cliente
),
total_fat AS (
  SELECT SUM(faturamento) AS total_faturamento
  FROM itens
)
SELECT cf.cliente,
       ROUND(cf.faturamento, 2) AS faturamento,
       ROUND(cf.faturamento / tf.total_faturamento * 100, 1) AS percentual
FROM client_fat cf
CROSS JOIN total_fat tf
ORDER BY cf.faturamento DESC
LIMIT 1;
