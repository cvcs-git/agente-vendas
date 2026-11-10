```sql
SELECT SUM(Total) AS faturamento
FROM vendas
WHERE "Cidade/UF" = 'Paulista' AND strftime('%Y-%m', Emissão) = '2026-04';
```
