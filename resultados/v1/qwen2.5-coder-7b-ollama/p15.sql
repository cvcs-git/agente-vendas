```sql
WITH faturamento_mensal AS (
  SELECT 
    strftime('%Y-%m', Emissão) AS mes,
    SUM(Total) AS faturamento
  FROM 
    vendas
  WHERE 
    strftime('%Y', Emissão) = '2026'
  GROUP BY 
    mes
)
SELECT 
  mes,
  faturamento,
  LAG(faturamento) OVER (ORDER BY mes) AS faturamento_anterior
FROM 
  faturamento_mensal
ORDER BY 
  mes;
```
