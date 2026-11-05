-- P18: Quais clientes compraram alças até hoje?
-- Esperado: resultado vazio (não há alças na base)
SELECT DISTINCT cliente
FROM itens
WHERE descricao LIKE '%ALCA%' OR descricao LIKE '%ALÇA%'
