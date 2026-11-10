```sql
SELECT COUNT(DISTINCT "#") AS produtos_diferentes
FROM vendas
WHERE strftime('%Y-%m', Emissão) = '2026-05';
```
