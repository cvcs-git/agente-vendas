```sql
WITH unidades_vendidas AS (
  SELECT
    "#",
    SUM(CASE WHEN strftime('%m', Emissão) = '01' THEN Qnt ELSE 0 END) AS jan_unidades,
    SUM(CASE WHEN strftime('%m', Emissão) = '02' THEN Qnt ELSE 0 END) AS fev_unidades
  FROM vendas
  WHERE Nota NOT LIKE 'NFe 2217'
  GROUP BY "#"
)
SELECT
  "#",
  jan_unidades,
  fev_unidades,
  fev_unidades - jan_unidades AS aumento_unidades
FROM unidades_vendidas
ORDER BY aumento_unidades DESC
LIMIT 1;
```
