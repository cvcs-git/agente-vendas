-- V02: Quantas tampas 26 foram vendidas em janeiro?
-- Esperado: 657300 (código 97; vendas 724100 menos cancelamentos 66800)
SELECT SUM(quantidade) AS unidades
FROM itens
WHERE mes = '2026-01'
  AND descricao LIKE '%TAMPA%26MM%'
