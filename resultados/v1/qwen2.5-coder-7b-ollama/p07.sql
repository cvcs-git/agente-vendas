```sql
SELECT 
  cliente, 
  AVG(julianday(pedido2.emissao) - julianday(pedido1.emissao)) AS media_dias
FROM 
  pedidos_efetivos pedido1
JOIN 
  pedidos_efetivos pedido2
ON 
  pedido1.cliente = pedido2.cliente
  AND pedido1.pedido < pedido2.pedido
GROUP BY 
  cliente
ORDER BY 
  media_dias ASC
LIMIT 1;
```
