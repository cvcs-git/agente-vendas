SELECT COUNT(DISTINCT "#") AS total_produtos
FROM "vendas"
WHERE strftime('%Y-%m', "Emissão") = '2026-05'
  AND "Qnt" > 0;