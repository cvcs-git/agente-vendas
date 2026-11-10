SELECT ROUND(SUM(quantidade), 2) AS unidades
FROM itens
WHERE mes = '2026-08'
  AND descricao LIKE '%FRASCO 500ML%'
