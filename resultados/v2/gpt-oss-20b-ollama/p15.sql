WITH monthly AS (
  SELECT mes, SUM(faturamento) AS faturamento
  FROM itens
  WHERE mes LIKE '2026-%'
  GROUP BY mes
),
ordered AS (
  SELECT mes, faturamento,
         ROW_NUMBER() OVER (ORDER BY mes) AS rn,
         COUNT(*) OVER () AS total
  FROM monthly
),
first_half AS (
  SELECT AVG(faturamento) AS avg_f
  FROM ordered
  WHERE rn <= total/2.0
),
second_half AS (
  SELECT AVG(faturamento) AS avg_s
  FROM ordered
  WHERE rn > total/2.0
)
SELECT ROUND(f.avg_f, 2) AS avg_first_half,
       ROUND(s.avg_s, 2) AS avg_second_half,
       ROUND((s.avg_s - f.avg_f) / f.avg_f * 100, 1) AS variation_percent
FROM first_half f, second_half s;
