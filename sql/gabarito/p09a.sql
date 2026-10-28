-- P09a: Qual vendedor vendeu mais em maio de 2026?
-- Regra: "vendeu mais" (vendedor) = faturamento líquido
-- Aviso obrigatório na resposta: a comparação reflete o tamanho da carteira, não o desempenho individual
SELECT Vendedor, 
    ROUND(SUM(Total), 2) AS faturamento
FROM vendas
WHERE strftime('%Y-%m', "Emissão") = '2026-05'
GROUP BY Vendedor
ORDER BY faturamento DESC;