WITH prod_qty AS (
  SELECT
    "Razão Social" AS cliente,
    "#" AS produto,
    SUM("Qnt") AS total_qnt
  FROM vendas
  WHERE "Nota" <> 'NFe 2217'
  GROUP BY "Razão Social", "#"
),
ranked AS (
  SELECT
    cliente,
    produto,
    total_qnt,
    ROW_NUMBER() OVER (PARTITION BY cliente ORDER BY total_qnt DESC) AS rn
  FROM prod_qty
)
SELECT cliente, produto, total_qnt
FROM ranked
WHERE rn = 1
ORDER BY cliente;
