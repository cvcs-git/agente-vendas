SELECT SUM(faturamento)/COUNT(pedido) AS ticket_medio
FROM pedidos_efetivos
WHERE cliente = 'Comercial Alfa';
