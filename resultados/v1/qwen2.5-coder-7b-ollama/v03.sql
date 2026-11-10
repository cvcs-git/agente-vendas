```sql
SELECT MAX(Emissão) AS Ultimo_Cancelamento
FROM vendas
WHERE "Razão Social" = 'Atacado Omega' AND Qnt < 0;
```
