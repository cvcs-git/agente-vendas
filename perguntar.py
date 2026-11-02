import argparse
import os
import time

import requests

URL_OLLAMA = "http://localhost:11434/api/chat"


def perguntar(modelo, prompt_sistema, pergunta, raciocinio=None, contexto=8192):
    corpo = {
        "model": modelo,
        "messages": [
            {"role": "system", "content": prompt_sistema},
            {"role": "user", "content": pergunta},
        ],
        "stream": False,
        "options": {"temperature": 0, "num_ctx": contexto},
    }
    if raciocinio:
        corpo["think"] = raciocinio

    inicio = time.time()
    resposta = requests.post(URL_OLLAMA, json=corpo, timeout=600)
    resposta.raise_for_status()
    segundos = time.time() - inicio

    return resposta.json()["message"]["content"].strip(), segundos


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Faz uma pergunta a um modelo local do Ollama")
    parser.add_argument("modelo", help="ex.: qwen2.5-coder:7b")
    parser.add_argument("prompt", help="arquivo do prompt de sistema, ex.: prompts/sistema_v3.md")
    parser.add_argument("saida", help="arquivo onde salvar a resposta, ex.: resultados/v3/qwen2.5-coder-7b/p05.sql")
    parser.add_argument("pergunta", help="a pergunta, entre aspas")
    parser.add_argument("--raciocinio", help="nível de raciocínio, ex.: medium (só para modelos com raciocínio)")
    args = parser.parse_args()

    with open(args.prompt, encoding="utf-8") as arquivo:
        prompt_sistema = arquivo.read()

    texto, segundos = perguntar(args.modelo, prompt_sistema, args.pergunta, args.raciocinio)

    os.makedirs(os.path.dirname(args.saida), exist_ok=True)
    with open(args.saida, "w", encoding="utf-8") as arquivo:
        arquivo.write(texto + "\n")

    print(texto)
    print(f"\n[{args.modelo} | {segundos:.1f} s | salvo em {args.saida}]")