SELECT cliente, ROUND(SUM(CASE WHEN tipo = 'cancelamento' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS percentual_cancelamentos
FROM itens
WHERE mes BETWEEN '2026-01' AND '2026-12'
GROUP BY cliente
ORDER BY percentual_cancelamentos DESC
LIMIT 1
