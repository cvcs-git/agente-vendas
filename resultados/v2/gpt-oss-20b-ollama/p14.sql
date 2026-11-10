WITH client_rev AS (
  SELECT cliente, SUM(faturamento) AS rev
  FROM itens
  GROUP BY cliente
),
cum_rev AS (
  SELECT cliente,
         rev,
         SUM(rev) OVER (ORDER BY rev DESC) AS cum_rev,
         SUM(rev) OVER () AS total_rev,
         ROW_NUMBER() OVER (ORDER BY rev DESC) AS rn
  FROM client_rev
)
SELECT rn AS num_clientes
FROM cum_rev
WHERE cum_rev >= 0.8 * total_rev
ORDER BY rn
LIMIT 1;
