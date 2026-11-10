```sql
SELECT SUM(Total) / (SELECT SUM(Total) FROM vendas WHERE strftime('%Y-%m', Emissão) = '2026-01') * 100 AS participacao
FROM vendas
WHERE strftime('%Y-%m', Emissão) = '2026-01' AND Vendedor = 'Vendedor B';
```
