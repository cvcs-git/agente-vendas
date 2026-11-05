-- P27: Qual produto é o mais vendido de cada cliente?
-- Esperado: OMEGA 97; ALFA 97; BETA 443; DELTA 443; GAMA 97 (627000)
SELECT cliente, codigo_produto, descricao, unidades
FROM (
  SELECT cliente, codigo_produto, MIN(descricao) AS descricao,
         SUM(quantidade) AS unidades,
         ROW_NUMBER() OVER (PARTITION BY cliente ORDER BY SUM(quantidade) DESC) AS posicao
  FROM itens
  GROUP BY cliente, codigo_produto
)
WHERE posicao = 1
ORDER BY cliente
