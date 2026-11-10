```sql
SELECT produto_base, SUM(Qnt) AS total_unidades
FROM vendas
WHERE Nota != 'NFe 2217'
GROUP BY produto_base
ORDER BY total_unidades DESC
LIMIT 1;
```
