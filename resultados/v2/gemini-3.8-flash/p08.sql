SELECT cliente, ROUND(SUM(faturamento) / COUNT(*), 2) AS ticket_medio FROM
pedidos_efetivos WHERE cliente LIKE '%Comercial Alfa%' GROUP BY cliente
