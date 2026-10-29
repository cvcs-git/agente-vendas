-- View pedidos_efetivos: um pedido por linha, sem os pedidos originais que foram cancelados
-- Regras: cancelamento anula a nota inteira; o original é a nota do mesmo cliente,
--         mesmo valor (positivo), emitida antes, a mais recente; a reemissão permanece
DROP VIEW IF EXISTS pedidos_efetivos;

CREATE VIEW pedidos_efetivos AS
WITH notas AS (
    SELECT Nota,
            Venda,
            "Razão Social" AS cliente,
            Vendedor,
            MIN("Emissão") AS emissao,
            ROUND(SUM(Total), 2) AS valor
    FROM vendas
    GROUP BY Nota, Venda, "Razão Social", Vendedor
),
originais_cancelados AS(
    SELECT (SELECT o.Nota
            FROM notas o
            WHERE cliente = c.cliente
                AND o.valor = -c.valor
                AND o.emissao < c.emissao
            ORDER BY o.emissao DESC
            LIMIT 1) AS Nota
    FROM notas c
    WHERE c.valor < 0
)
SELECT Venda AS pedido,
        Nota AS nota,
        cliente,
        Vendedor AS vendedor,
        emissao,
        valor AS faturamento
FROM notas
WHERE valor > 0 
    AND Nota NOT IN (SELECT Nota FROM originais_cancelados WHERE Nota IS NOT NULL);
    