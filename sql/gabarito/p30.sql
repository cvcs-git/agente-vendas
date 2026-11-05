-- P30: Em quais meses o faturamento da Beta ficou acima da média mensal dela?
-- Esperado: 2026-03, 2026-05, 2026-06, 2026-08 (média mensal 114431.03)
WITH mensal AS (
  SELECT mes, SUM(faturamento) AS faturamento
  FROM itens
  WHERE cliente LIKE '%BETA%' OR nome_fantasia LIKE '%BETA%'
  GROUP BY mes
)
SELECT mes,
       ROUND(faturamento, 2) AS faturamento,
       ROUND((SELECT AVG(faturamento) FROM mensal), 2) AS media_mensal
FROM mensal
WHERE faturamento > (SELECT AVG(faturamento) FROM mensal)
ORDER BY mes
