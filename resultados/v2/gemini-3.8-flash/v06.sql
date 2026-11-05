SELECT COUNT(DISTINCT cliente) AS clientes FROM pedidos_efetivos WHERE mes =
'2026-05' AND (vendedor LIKE '%Vendedor A%' OR vendedor = 'A')
