SELECT COUNT(DISTINCT cliente) AS clientes_atendidos
FROM pedidos_efetivos
WHERE vendedor = 'A'
  AND strftime('%m', emissao) = '05'
  AND strftime('%Y', emissao) = '2026';
