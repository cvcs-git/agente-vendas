-- P23: Qual produto teve maior aumento em unidades vendidas do primeiro para o segundo bimestre?
-- Esperado: 439 FRASCO 500ML, +184700 (+25.4%)
SELECT codigo_produto,
       MIN(descricao) AS descricao,
       SUM(CASE WHEN mes IN ('2026-01', '2026-02') THEN quantidade END) AS bimestre_1,
       SUM(CASE WHEN mes IN ('2026-03', '2026-04') THEN quantidade END) AS bimestre_2,
       SUM(CASE WHEN mes IN ('2026-03', '2026-04') THEN quantidade END)
         - SUM(CASE WHEN mes IN ('2026-01', '2026-02') THEN quantidade END) AS aumento
FROM itens
GROUP BY codigo_produto
ORDER BY aumento DESC
