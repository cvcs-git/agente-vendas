SELECT SUM(faturamento) AS faturamento
FROM itens
WHERE cliente LIKE '%delta%' OR nome_fantasia LIKE '%delta%'
  AND produto_base = 'tampa 26'
  AND mes = '2026-03'
