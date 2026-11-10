```sql
SELECT SUM(Total) AS faturamento
FROM vendas
WHERE strftime('%Y-%m', Emissão) = '2026-05' AND Cidade/UF = 'RN';
```
