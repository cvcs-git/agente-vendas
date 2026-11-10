```sql
WITH faturamento_mensal AS (
  SELECT 
    strftime('%Y-%m', Emissão) AS mes,
    SUM(CASE WHEN Total > 0 THEN Total ELSE 0 END) AS faturamento
  FROM vendas
  WHERE "Razão Social" = 'Beta'
  GROUP BY mes
),
media_mensal AS (
  SELECT AVG(faturamento) AS media
  FROM faturamento_mensal
)
SELECT fm.mes, fm.faturamento
FROM faturamento_mensal fm
JOIN media_mensal mm ON 1=1
WHERE fm.faturamento > mm.media;
```
