SELECT
  "Razão Social" AS cliente,
  "Descrição" AS produto,
  total_units
FROM (
  SELECT
    "Razão Social",
    "Descrição",
    SUM("Qnt") AS total_units,
    ROW_NUMBER() OVER (
      PARTITION BY "Razão Social"
      ORDER BY SUM("Qnt") DESC
    ) AS rn
  FROM vendas
  WHERE "Qnt" > 0
    AND "Nota" <> 'NFe 2217'
  GROUP BY "Razão Social", "Descrição"
) t
WHERE rn = 1;