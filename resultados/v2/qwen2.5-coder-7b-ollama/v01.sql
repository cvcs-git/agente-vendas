SELECT SUM(quantidade) AS unidades_vendidas
FROM itens
WHERE mes = '2026-04'
  AND produto_base = 'tampa'
  AND codigo_produto = '38'
  AND descricao LIKE '%vermelho%'
