-- Explora a regra que associa cada nota de cancelamento à nota original que ela anula
-- Regra: mesmo cliente, mesmo valor (positivo), emitida antes; se houver várias, a mais recente
WITH notas AS (
    SELECT Nota,
            Venda,
            "Razão Social" AS cliente,
            MIN("Emissão") AS emissao,
            ROUND(SUM(Total), 2) AS valor
    FROM vendas
    GROUP BY Nota, Venda, "Razão Social"
)
SELECT c.Nota AS nota_cancelamento,
        c.cliente,
        c.emissao AS data_cancelamento,
        c.valor,
        (SELECT o.Nota
        FROM notas o
        WHERE o.cliente = c.cliente
         AND o.valor = -c.valor
            AND o.emissao < c.emissao
        ORDER BY o.emissao DESC
        LIMIT 1) AS nota_original
FROM notas c
WHERE c.valor < 0
ORDER BY c.emissao;