# Perguntas de avaliação

Definidas em 03 e 05/11/2026, antes das rodadas complementares da v1 e da v2.

- `perguntas_avaliacao.csv`: índice das 40 perguntas (30 de desenvolvimento, 10 de validação), separado por `;`.
- `sql/gabarito/p18.sql` a `p30.sql`: SQLs de referência das perguntas novas de desenvolvimento.
- `sql/gabarito/validacao/v01.sql` a `v10.sql`: SQLs de referência da validação.
- Coluna `origem`: `original` (P01–P16, usadas para escrever a v2), `nova` (P18–P30) ou `validação`.
- Perguntas sem SQL (o gabarito é o comportamento): P04, P12, P16, P19, P26, V07, V09.

## Regras

1. Validação nunca orienta ajustes no prompt. Rodar, registrar o placar e não mexer no prompt por causa dela.
2. Comparar o resultado, não o SQL. Números com tolerância de arredondamento.
3. Quando o prompt não define um termo, toda resposta defensável pelas regras do prompt conta como acerto (coluna `acerto`).
4. SQLs de referência escritos sobre as views gold (`itens` e `pedidos_efetivos`, estado do commit `f76ac08`), validados em 05/11/2026 na base sintética. Valem também como gabarito da v1: os resultados são os mesmos na tabela `vendas`.
5. Data de referência: 31/08/2026.
6. Em perguntas sem dados, só SEM DADOS conta como acerto. ESCLARECER conta como erro, porque os prompts reservam ESCLARECER para perguntas com mais de uma interpretação (decidido em 05/11/2026, na V09 da v1).

## Rodadas complementares (só perguntas novas, salvo indicação)

| Modelo | Versão | Perguntas |
|---|---|---|
| gpt-oss-20b (Groq) | v1 (`aa3a96f`) | P18–P30 e V01–V10 |
| gpt-oss-20b (Groq) | v2 (`f76ac08`) | P18–P30 e V01–V10 |
| gemini-3.8-flash | v1 | P18–P30 e V01–V10 |
| gemini-3.8-flash | v2 | todas as 40 |

Rodar antes de acrescentar `nome_fantasia` à view `pedidos_efetivos`. Placar sempre separado por conjunto.

