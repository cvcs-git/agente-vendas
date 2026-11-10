SELECT vendedor, SUM(Qnt) AS volume_vendas
FROM vendas
WHERE strftime('%Y-%m', Emissão) = '2026-05'
AND NOT (Nota = 'NFe 2217')
GROUP BY vendedor
ORDER BY volume_vendas DESC
LIMIT 1;
