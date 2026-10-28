-- P11: Quantos produtos diferentes foram vendidos em maio de 2026?
-- Regra: produto diferente = código distinto (coluna "#", futura codigo_produto)
-- Considera só linhas de venda (Total > 0); linhas de cancelamento não indicam venda
SELECT COUNT(DISTINCT "#") AS produtos_diferentes
FROM vendas
WHERE strftime ('%Y-%m', "Emissão") = "2026-05"
    AND Total > 0;