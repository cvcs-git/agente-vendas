SELECT MAX(emissao) AS ultima_compra
FROM pedidos_efetivos
WHERE cliente IN (
  SELECT "Razão Social"
  FROM vendas
  WHERE "Razão Social" LIKE '%Corneto%'
     OR "Nome Fantasia" LIKE '%Corneto%'
);