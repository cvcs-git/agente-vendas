-- Validação 1: a soma da view precisa ser igual ao faturamento líquido da base
SELECT COUNT (*) AS pedidos_efetivos,
        ROUND(SUM(faturamento), 2) AS faturamento_view,
        (SELECT ROUND(SUM(Total), 2) FROM vendas) AS faturamento_base
FROM pedidos_efetivos;