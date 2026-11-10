SELECT 
    AVG(CASE WHEN mes BETWEEN '2026-01' AND '2026-06' THEN faturamento ELSE 0 END) AS media_primeira_metade,
    AVG(CASE WHEN mes BETWEEN '2026-07' AND '2026-12' THEN faturamento ELSE 0 END) AS media_segunda_metade,
    ROUND(((AVG(CASE WHEN mes BETWEEN '2026-07' AND '2026-12' THEN faturamento ELSE 0 END) - AVG(CASE WHEN mes BETWEEN '2026-01' AND '2026-06' THEN faturamento ELSE 0 END)) / AVG(CASE WHEN mes BETWEEN '2026-01' AND '2026-06' THEN faturamento ELSE 0 END)) * 100, 1) AS variação_percentual
FROM pedidos_efetivos
