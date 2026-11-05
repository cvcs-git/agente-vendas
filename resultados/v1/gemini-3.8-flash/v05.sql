SELECT 
  ROUND((SUM("Total NF") - SUM("Total")) * 100.0 / SUM("Total NF"), 2) AS perc_imposto
FROM "vendas"
WHERE ("Razão Social" LIKE '%Alfa%' OR "Nome Fantasia" LIKE '%Alfa%')
  AND strftime('%Y', "Emissão") = '2026';