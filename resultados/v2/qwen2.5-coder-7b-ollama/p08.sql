SELECT ROUND(AVG(faturamento), 2) AS ticket_medio
FROM itens
WHERE cliente LIKE '%comercial alfa%' OR nome_fantasia LIKE '%comercial alfa%'
