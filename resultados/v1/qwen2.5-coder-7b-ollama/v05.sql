```sql
SELECT 
  SUM(CASE WHEN "Razão Social" = 'Alfa' THEN "Total NF" - "Total" ELSE 0 END) / 
  SUM(CASE WHEN "Razão Social" = 'Alfa' THEN "Total NF" ELSE 0 END) * 100 AS porcentagem_imposto
FROM vendas
WHERE strftime('%Y', "Emissão") = '2026';
```
