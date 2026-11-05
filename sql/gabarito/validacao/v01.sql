-- V01: Quantas tampas 38 vermelhas vendemos em abril?
-- Esperado: NULL (não existe tampa 38 vermelha; a única tampa 38 é a branca, código 443)
SELECT SUM(quantidade) AS unidades
FROM itens
WHERE mes = '2026-04'
  AND descricao LIKE '%TAMPA%38%'
  AND descricao LIKE '%VERMELH%'
