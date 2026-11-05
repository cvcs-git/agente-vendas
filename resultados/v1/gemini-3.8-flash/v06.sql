SELECT COUNT(DISTINCT cliente) AS total_clientes
FROM pedidos_efetivos
WHERE vendedor = 'Vendedor A'
  AND strftime('%Y-%m', emissao) = '2026-05';