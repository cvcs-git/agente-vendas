SELECT
  CASE
    WHEN SUM("Total NF") = 0 THEN NULL
    ELSE ROUND(100.0 * SUM("Total NF" - "Total") / SUM("Total NF"), 2)
  END AS pct_imposto
FROM vendas
WHERE ("Razão Social" LIKE '%Alfa%' OR "Nome Fantasia" LIKE '%Alfa%')
  AND strftime('%Y', Emissão) = '2026';
