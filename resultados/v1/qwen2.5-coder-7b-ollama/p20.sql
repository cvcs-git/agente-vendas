```sql
SELECT MAX(Emissão) AS Ultima_Compra
FROM vendas
WHERE Descrição LIKE '%Corneto%'
AND Emissão < '2026-09-01';
```
