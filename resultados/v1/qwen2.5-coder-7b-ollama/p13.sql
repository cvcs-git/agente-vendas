```sql
WITH faturamento_quarter AS (
  SELECT
    cliente,
    SUM(CASE WHEN strftime('%m', emissao) IN ('01', '02', '03') THEN faturamento ELSE 0 END) AS faturamento_q1,
    SUM(CASE WHEN strftime('%m', emissao) IN ('04', '05', '06') THEN faturamento ELSE 0 END) AS faturamento_q2
  FROM pedidos_efetivos
  WHERE strftime('%Y', emissao) = '2026'
  GROUP BY cliente
)
SELECT
  cliente,
  faturamento_q1,
  faturamento_q2,
  ((faturamento_q2 - faturamento_q1) / faturamento_q1) * 100 AS crescimento_percentual
FROM faturamento_quarter
ORDER BY crescimento_percentual DESC;
```
