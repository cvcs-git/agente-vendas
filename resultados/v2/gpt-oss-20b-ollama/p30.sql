WITH monthly AS (
  SELECT mes, SUM(faturamento) AS faturamento
  FROM itens
  WHERE cliente LIKE '%beta%' OR nome_fantasia LIKE '%beta%'
  GROUP BY mes
),
avg_monthly AS (
  SELECT AVG(faturamento) AS avg_faturamento FROM monthly
)
SELECT m.mes, ROUND(m.faturamento, 2) AS faturamento
FROM monthly m, avg_monthly a
WHERE m.faturamento > a.avg_faturamento
ORDER BY m.mes;
