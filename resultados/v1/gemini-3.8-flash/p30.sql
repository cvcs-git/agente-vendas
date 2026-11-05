WITH faturamento_mensal AS (
  SELECT
    strftime('%Y-%m', "Emissão") AS mes,
    SUM("Total") AS faturamento
  FROM "vendas"
  WHERE "Razão Social" LIKE '%Beta%' OR "Nome Fantasia" LIKE '%Beta%'
  GROUP BY strftime('%Y-%m', "Emissão")
),
media AS (
  SELECT AVG(faturamento) AS media_mensal
  FROM faturamento_mensal
)
SELECT
  mes,
  faturamento
FROM faturamento_mensal, media
WHERE faturamento > media_mensal
ORDER BY mes;