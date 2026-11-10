```sql
SELECT 
  "Razão Social", 
  SUM(CASE WHEN "Total" < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS "Percentual Cancelados"
FROM 
  vendas
WHERE 
  strftime('%Y', "Emissão") = strftime('%Y', 'now')
GROUP BY 
  "Razão Social"
ORDER BY 
  "Percentual Cancelados" DESC
LIMIT 1;
```
