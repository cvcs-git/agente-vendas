WITH faturamento_mensal AS ( SELECT mes, SUM(faturamento) AS faturamento FROM
itens WHERE mes LIKE '2026%' GROUP BY mes ), metades AS ( SELECT faturamento,
NTILE(2) OVER (ORDER BY mes) AS metade FROM faturamento_mensal ), medias AS (
SELECT AVG(CASE WHEN metade = 1 THEN faturamento END) AS media_primeira_metade,
AVG(CASE WHEN metade = 2 THEN faturamento END) AS media_segunda_metade FROM
metades ) SELECT ROUND(media_primeira_metade, 2) AS media_primeira_metade,
ROUND(media_segunda_metade, 2) AS media_segunda_metade,
ROUND(((media_segunda_metade - media_primeira_metade) / media_primeira_metade)
* 100.0, 1) AS variacao_percentual FROM medias
