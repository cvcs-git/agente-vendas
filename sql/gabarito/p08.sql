-- P08: Qual o ticket médio da Comercial Alfa?
-- Regras: busca de cliente por trecho, em Razão Social e Nome Fantasia; exibição pela Razão Social
--         ticket médio = faturamento líquido ÷ pedidos líquidos
SELECT "Razão Social" AS cliente,
    ROUND(SUM(Total), 2) AS faturamento,
    COUNT (DISTINCT CASE WHEN Total > 0 THEN Venda END) -
    COUNT (DISTINCT CASE WHEN Total < 0 THEN Venda END) AS pedidos_liquidos,
    ROUND(SUM(Total) * 1.0 / 
        (COUNT (DISTINCT CASE WHEN Total > 0 THEN Venda END) - 
        COUNT (DISTINCT CASE WHEN Total < 0  THEN Venda END)), 2) AS ticket_medio
FROM vendas
WHERE UPPER ("Razão Social") LIKE '%ALFA%'
    OR UPPER ("Nome Fantasia") LIKE '%ALFA%'
GROUP BY "Razão Social";
