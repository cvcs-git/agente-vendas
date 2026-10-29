WITH faturamento_trimestres AS (
  SELECT
    "Razão Social" AS cliente,
    SUM(CASE WHEN "Emissão" >= '2026-01-01' AND "Emissão" < '2026-04-01' THEN "Total" ELSE 0 END) AS fat_t1,
    SUM(CASE WHEN "Emissão" >= '2026-04-01' AND "Emissão" < '2026-07-01' THEN "Total" ELSE 0 END) AS fat_t2
  FROM "vendas"
  WHERE "Emissão" >= '2026-01-01' AND "Emissão" < '2026-07-01'
  GROUP BY "Razão Social"
)
SELECT
  cliente,
  ROUND(fat_t1, 2) AS faturamento_t1,
  ROUND(fat_t2, 2) AS faturamento_t2,
  CASE
    WHEN fat_t1 > 0 THEN ROUND(((fat_t2 - fat_t1) / fat_t1) * 100.0, 2)
    ELSE NULL
  END AS variacao_percentual,
  CASE
    WHEN fat_t2 > fat_t1 THEN 'Cresceu'
    WHEN fat_t2 < fat_t1 THEN 'Caiu'
    ELSE 'Estável'
  END AS evolucao
FROM faturamento_trimestres
WHERE fat_t1 > 0 OR fat_t2 > 0
ORDER BY variacao_percentual DESC;