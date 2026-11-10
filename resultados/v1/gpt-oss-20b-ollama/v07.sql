SELECT
  ROUND(100.0 * SUM(CASE WHEN "Vendedor" = 'Vendedor B' THEN "Total" ELSE 0 END) / SUM("Total"), 2) AS participacao_percent
FROM vendas
WHERE strftime('%Y', "Emissão") = strftime('%Y', 'now')
  AND strftime('%m', "Emissão") IN ('01', '02');
