```sql
SELECT strftime('%w', Emissão) AS dia_semana, SUM(Total) AS faturamento
FROM vendas
GROUP BY strftime('%w', Emissão)
ORDER BY faturamento DESC
LIMIT 1;
```
