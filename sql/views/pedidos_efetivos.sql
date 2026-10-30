-- Gold: um pedido por linha, sem os pedidos originais que foram cancelados
-- Regras: cancelamento anula a nota inteira; o original é a nota do mesmo cliente,
--         mesmo valor (positivo), emitida antes, a mais recente; a reemissão permanece
DROP VIEW IF EXISTS pedidos_efetivos;

CREATE VIEW pedidos_efetivos AS
WITH notas AS (
    SELECT nota,
           pedido,
           cliente,
           vendedor,
           MIN(emissao) AS emissao,
           ROUND(SUM(faturamento), 2) AS valor
    FROM silver_itens
    GROUP BY nota, pedido, cliente, vendedor
),
originais_cancelados AS (
    SELECT (SELECT o.nota
            FROM notas o
            WHERE o.cliente = c.cliente
              AND o.valor = -c.valor
              AND o.emissao < c.emissao
            ORDER BY o.emissao DESC
            LIMIT 1) AS nota
    FROM notas c
    WHERE c.valor < 0
)
SELECT pedido,
       nota,
       cliente,
       vendedor,
       emissao,
       substr(emissao, 1, 7) AS mes,
       valor AS faturamento
FROM notas
WHERE valor > 0
  AND nota NOT IN (SELECT nota FROM originais_cancelados WHERE nota IS NOT NULL);