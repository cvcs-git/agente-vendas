```sql
SELECT SUM(Qnt) 
FROM vendas 
WHERE produto_base = 'Tampa 38' AND cor = 'Vermelho' AND strftime('%Y-%m', Emissão) = '2026-04';
```
