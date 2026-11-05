SELECT *
FROM pedidos_efetivos
WHERE strftime('%Y-%m', emissao) = '2026-08'
  AND cliente IN (
    SELECT DISTINCT "Razão Social"
    FROM vendas
    WHERE "Razão Social" LIKE '%lambda%' OR "Nome Fantasia" LIKE '%lambda%'
  );