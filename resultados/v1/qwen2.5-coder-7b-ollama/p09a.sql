```sql
SELECT vendedor, SUM(faturamento) AS total_faturamento
FROM pedidos_efetivos
WHERE strftime('%Y-%m', emissao) = '2026-05'
GROUP BY vendedor
ORDER BY total_faturamento DESC
LIMIT 1;
```
