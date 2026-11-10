SELECT ROUND(100.0 * SUM(CASE WHEN vendedor = 'Vendedor B' THEN faturamento END) / SUM(faturamento), 1) AS participacao
FROM itens
WHERE mes IN ('2026-01', '2026-02');
