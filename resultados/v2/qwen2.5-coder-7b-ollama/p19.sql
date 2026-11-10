SELECT SUM(faturamento) AS faturamento_devolucoes
FROM itens
WHERE mes LIKE '2026-%' AND tipo = 'cancelamento' AND faturamento < 0;
