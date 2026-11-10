SELECT CASE WHEN EXISTS (
    SELECT 1 FROM pedidos_efetivos
    WHERE (cliente LIKE '%lambda%' OR nome_fantasia LIKE '%lambda%')
      AND mes = '2026-08'
) THEN 'SIM' ELSE 'NAO' END AS fez_pedido;
