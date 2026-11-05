WITH ranking_produtos AS (
  SELECT
    "Razão Social",
    "#",
    MAX("Descrição") AS "Descrição",
    SUM("Qnt") AS total_quantidade,
    ROW_NUMBER() OVER (
      PARTITION BY "Razão Social"
      ORDER BY SUM("Qnt") DESC
    ) AS rn
  FROM "vendas"
  WHERE "Nota" != 'NFe 2217'
  GROUP BY "Razão Social", "#"
)
SELECT
  "Razão Social",
  "#" AS codigo_produto,
  "Descrição",
  total_quantidade
FROM ranking_produtos
WHERE rn = 1
ORDER BY "Razão Social";