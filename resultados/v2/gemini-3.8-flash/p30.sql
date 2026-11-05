WITH faturamento_mensal AS ( SELECT cliente, mes, SUM(faturamento) AS
faturamento FROM itens WHERE cliente LIKE '%beta%' OR nome_fantasia LIKE
'%beta%' GROUP BY cliente, mes ), com_media AS ( SELECT cliente, mes,
faturamento, AVG(faturamento) OVER (PARTITION BY cliente) AS media_mensal FROM
faturamento_mensal ) SELECT cliente, mes, ROUND(faturamento, 2) AS faturamento,
ROUND(media_mensal, 2) AS media_mensal FROM com_media WHERE faturamento >
media_mensal ORDER BY cliente, mes
