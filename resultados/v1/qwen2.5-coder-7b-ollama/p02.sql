```sql
SELECT 
  "#", 
  SUM(Qnt) AS total_unidades 
FROM 
  vendas 
WHERE 
  strftime('%Y-%m', Emissão) = strftime('%Y-%m', 'now') 
  AND "#" != '2217' 
GROUP BY 
  "#" 
ORDER BY 
  total_unidades DESC 
LIMIT 1;
```
