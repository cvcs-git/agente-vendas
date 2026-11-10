```sql
SELECT MAX(T1.Emissão) AS UltimaCompra
FROM vendas AS T1
JOIN pedidos_efetivos AS T2 ON T1.Venda = T2.pedido
WHERE T2.cliente LIKE '%Delta%' AND T1.cor = 'preta' AND T1.Descrição LIKE '%tampa%'
AND T1.Nota != 'NFe 2217';
```
