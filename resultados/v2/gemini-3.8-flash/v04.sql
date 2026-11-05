SELECT cliente, COUNT(*) AS pedidos FROM pedidos_efetivos WHERE cliente LIKE
'%lambda%' AND mes = '2026-08' GROUP BY cliente
