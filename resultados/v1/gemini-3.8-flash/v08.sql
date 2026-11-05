SELECT 
  v."Razão Social",
  COUNT(DISTINCT CASE WHEN pe.pedido IS NULL THEN v."Venda" END) * 100.0 / COUNT(DISTINCT v."Venda") AS percentual_cancelados
FROM "vendas" v
LEFT JOIN "pedidos_efetivos" pe 
  ON v."Venda" = pe.pedido
WHERE strftime('%Y', v."Emissão") = '2026'
  AND v."Total" > 0
GROUP BY v."Razão Social"
ORDER BY percentual_cancelados DESC
LIMIT 1;