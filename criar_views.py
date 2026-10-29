import sqlite3
import sys

CAMINHO_DB = "data/vendas_sintetico.db"


def criar_view(caminho_sql):
    with open(caminho_sql, encoding = "utf-8") as arquivo:
        sql = arquivo.read()

    conexao = sqlite3.connect(CAMINHO_DB)
    conexao.executescript(sql)
    conexao.close()
    print(f"View criada a partir de {caminho_sql}")

if __name__ == "__main__":
        criar_view(sys.argv[1])