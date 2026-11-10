SELECT cliente FROM pedidos_efetivos WHERE strftime('%Y-%m', emissao) = '2026-08' GROUP BY cliente ORDER BY COUNT(*) DESC LIMIT 1
