-- P01: Qual cliente fez mais pedidos este mês?
-- Regras: data de referência dos testes = 31/08/2026, então "este mês" = agosto de 2026
--         pedido = Venda distinta; pedidos líquidos = Venda positivas − Venda de cancelamento
SELECT "Razão Social" AS cliente,
    COUNT(DISTINCT CASE WHEN Total > 0 THEN Venda END) AS pedidos_venda,
    COUNT(DISTINCT CASE WHEN Total < 0 THEN Venda END) AS cancelamentos,
    COUNT(DISTINCT CASE WHEN Total > 0 THEN Venda END) - 
    COUNT(DISTINCT CASE WHEN Total < 0 THEN Venda END) AS pedidos_liquidos
FROM vendas
WHERE strftime('%Y-%m', "Emissão") = '2026-08'
GROUP BY "Razão Social"
ORDER BY pedidos_liquidos DESC;
