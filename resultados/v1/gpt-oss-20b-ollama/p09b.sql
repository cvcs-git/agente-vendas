SELECT Vendedor, SUM(Qnt) AS volume
FROM vendas
WHERE strftime('%Y-%m', Emissao) = '2026-05'
  AND Qnt > 0
  AND Nota <> 'NFe 2217'
GROUP BY Vendedor
ORDER BY volume DESC
LIMIT 1;
