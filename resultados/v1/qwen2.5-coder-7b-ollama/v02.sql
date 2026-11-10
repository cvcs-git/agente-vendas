```sql
SELECT SUM(Qnt) AS total_tampas_26
FROM vendas
WHERE SUBSTR(Emissão, 1, 7) = '2026-01' AND Descrição LIKE '%tampa 26%';
```
