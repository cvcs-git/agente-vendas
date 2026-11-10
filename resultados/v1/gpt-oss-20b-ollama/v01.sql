SELECT SUM(Qnt) AS total_tampas_38_vermelhas
FROM vendas
WHERE Qnt > 0
  AND Nota <> 'NFe 2217'
  AND strftime('%m', Emissão) = '04'
  AND strftime('%Y', Emissão) = '2026'
  AND Descrição LIKE '%tampa%'
  AND Descrição LIKE '%38%'
  AND Descrição LIKE '%vermelha%';
