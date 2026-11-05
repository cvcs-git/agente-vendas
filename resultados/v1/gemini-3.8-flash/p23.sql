SELECT
  "#",
  "Descrição",
  SUM(CASE WHEN strftime('%m', "Emissão") IN ('03', '04') THEN "Qnt" ELSE 0 END) -
  SUM(CASE WHEN strftime('%m', "Emissão") IN ('01', '02') THEN "Qnt" ELSE 0 END) AS aumento_unidades
FROM "vendas"
WHERE "Nota" != 'NFe 2217'
  AND strftime('%Y', "Emissão") = '2026'
  AND strftime('%m', "Emissão") IN ('01', '02', '03', '04')
GROUP BY "#", "Descrição"
ORDER BY aumento_unidades DESC
LIMIT 1;
