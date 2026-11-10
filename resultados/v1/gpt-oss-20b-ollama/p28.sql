SELECT SUM(Total) AS faturamento
FROM vendas
WHERE strftime('%Y', Emissão) = '2026'
  AND strftime('%m', Emissão) = '05'
  AND "Cidade/UF" LIKE '%RN';
