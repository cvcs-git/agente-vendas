SELECT COUNT(DISTINCT cliente) AS clientes_atendidos
FROM pedidos_efetivos
WHERE mes = '2026-05'
  AND vendedor = 'A';
