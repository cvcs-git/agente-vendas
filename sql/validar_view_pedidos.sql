-- Validação 2: pedidos por cliente na view = pedidos líquidos calculados direto na base
WITH na_view AS(
    SELECT cliente,
            COUNT(*) AS pedidos_view
    FROM pedidos_efetivos
    GROUP BY cliente
),
liquidos AS (
    SELECT "Razão Social" AS cliente,
            COUNT(DISTINCT CASE WHEN Total > 0 THEN Venda END) - 
            COUNT(DISTINCT CASE WHEN Total < 0 THEN Venda END) AS pedidos_liquidos
    FROM vendas
    GROUP BY "Razão Social"
)
SELECT l.cliente,
        l.pedidos_liquidos,
        v.pedidos_view,
        CASE WHEN l.pedidos_liquidos = v.pedidos_view THEN 'OK' ELSE 'DIFERENTE' END AS confere
FROM liquidos l
LEFT JOIN na_view v ON v.cliente = l.cliente
ORDER BY l.cliente;