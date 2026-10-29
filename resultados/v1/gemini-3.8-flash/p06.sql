SELECT "#", "Descrição", SUM("Qnt") AS total_unidades
FROM "vendas"
WHERE strftime('%Y', "Emissão") = '2026'
  AND "Nota" != 'NFe 2217'
GROUP BY "#", "Descrição"
ORDER BY total_unidades DESC
LIMIT 1;