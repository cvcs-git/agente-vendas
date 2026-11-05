-- P21: Em qual mês a Delta comprou tampa preta pela última vez?
-- Esperado: 2026-07 (NFe 2263, 31/07/2026)
SELECT MAX(mes) AS ultimo_mes, MAX(emissao) AS ultima_emissao
FROM pedidos_efetivos
WHERE cliente LIKE '%DELTA%'
  AND pedido IN (SELECT pedido FROM itens
                 WHERE tipo = 'venda'
                   AND descricao LIKE '%TAMPA%'
                   AND descricao LIKE '%PRET%')
