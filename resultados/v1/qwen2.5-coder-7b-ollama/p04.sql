```sql
SELECT SUM(Qnt) AS Total_Unidades
FROM vendas
WHERE SUBSTR(Emissão, 1, 7) = '2026-08'
  AND Descrição = 'FRASCO 500ML';
```
