```sql
SELECT COUNT(*) 
FROM vendas 
WHERE Venda IN (
  SELECT Venda 
  FROM vendas 
  WHERE Total < 0 
  GROUP BY Venda 
  HAVING COUNT(*) > 1
);
```
