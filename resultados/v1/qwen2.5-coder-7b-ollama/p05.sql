```sql
SELECT SUM(faturamento) AS faturamento_julho_2026
FROM pedidos_efetivos
WHERE strftime('%Y-%m', emissao) = '2026-07';
```
