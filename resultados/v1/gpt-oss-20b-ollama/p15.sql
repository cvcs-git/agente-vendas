WITH monthly AS (
  SELECT strftime('%Y-%m', Emissão) AS month,
         SUM(Total) AS faturamento
  FROM vendas
  WHERE strftime('%Y', Emissão) = '2026'
  GROUP BY month
),
monthly_lag AS (
  SELECT month,
         faturamento,
         LAG(faturamento) OVER (ORDER BY month) AS prev_faturamento
  FROM monthly
)
SELECT month,
       faturamento,
       faturamento - prev_faturamento AS diff,
       CASE
         WHEN faturamento - prev_faturamento > 0 THEN 'crescendo'
         WHEN faturamento - prev_faturamento < 0 THEN 'caindo'
         ELSE 'estável'
       END AS trend
FROM monthly_lag
ORDER BY month;
