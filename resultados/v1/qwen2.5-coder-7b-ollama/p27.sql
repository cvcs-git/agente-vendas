```sql
SELECT 
  cliente, 
  produto_base, 
  SUM(Qnt) AS total_unidades
FROM 
  vendas
WHERE 
  Nota != 'NFe 2217'
GROUP BY 
  cliente, 
  produto_base
ORDER BY 
  cliente, 
  total_unidades DESC;
```
