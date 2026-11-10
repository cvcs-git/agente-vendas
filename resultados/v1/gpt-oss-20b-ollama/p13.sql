WITH faturamento_por_cliente AS (
  SELECT
    "Razão Social" AS cliente,
    SUM(CASE
          WHEN strftime('%Y', Emissão) = '2026'
           AND strftime('%m', Emissão) BETWEEN '01' AND '03'
          THEN Total
          ELSE 0
        END) AS q1,
    SUM(CASE
          WHEN strftime('%Y', Emissão) = '2026'
           AND strftime('%m', Emissão) BETWEEN '04' AND '06'
          THEN Total
          ELSE 0
        END) AS q2
  FROM vendas
  GROUP BY "Razão Social"
)
SELECT
  cliente,
  q1,
  q2,
  CASE
    WHEN q1 = 0 THEN NULL
    ELSE ((q2 - q1) / q1) * 100
  END AS percent_change
FROM faturamento_por_cliente
WHERE q1 <> 0 OR q2 <> 0
ORDER BY percent_change DESC;
