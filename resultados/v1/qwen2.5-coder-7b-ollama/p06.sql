SELECT "#" AS Produto, SUM(Qnt) AS Total_Unidades 
FROM vendas 
WHERE strftime('%Y', Emissão) = '2026' AND "#" != 'NFe 2217' 
GROUP BY "#" 
ORDER BY Total_Unidades DESC 
LIMIT 1;
