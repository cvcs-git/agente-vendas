```sql
SELECT 
  cliente, 
  SUM(faturamento) AS faturamento_total,
  (SUM(faturamento) / (SELECT SUM(faturamento) FROM pedidos_efetivos)) * 100 AS percentual
FROM 
  pedidos_efetivos
GROUP BY 
  cliente
ORDER BY 
  faturamento_total DESC
LIMIT 1;
```
