SELECT COUNT(DISTINCT cliente) AS clientes_atendidos
FROM pedidos_efetivos
WHERE vendedor = 'A' AND mes = '2026-05'
