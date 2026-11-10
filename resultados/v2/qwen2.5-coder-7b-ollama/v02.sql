SELECT SUM(quantidade) AS unidades_vendidas
FROM itens
WHERE mes = '2026-01' AND produto_base = 'tampa 26' AND tipo = 'venda'
