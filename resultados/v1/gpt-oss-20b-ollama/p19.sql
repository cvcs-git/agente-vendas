SELECT COUNT(DISTINCT Nota) AS devolucoes_ano
FROM vendas
WHERE Total < 0
  AND strftime('%Y', Emissão) = '2026';
