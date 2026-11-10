```sql
SELECT SUM(Total) AS gasto
FROM vendas
WHERE "Razão Social" LIKE '%Delta%'
  AND "Descrição" LIKE '%tampa 26%'
  AND strftime('%Y-%m', Emissão) = '2023-03';
```
