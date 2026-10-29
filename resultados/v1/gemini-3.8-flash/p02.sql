SELECT "#", "Descrição", SUM("Qnt") AS "Total_Unidades"
FROM "vendas"
WHERE "Nota" != 'NFe 2217'
  AND strftime('%Y-%m', "Emissão") = '2026-08'
GROUP BY "#", "Descrição"
ORDER BY "Total_Unidades" DESC
LIMIT 1;