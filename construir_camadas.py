import sqlite3
import sys

import pandas as pd

CAMINHO_DB = "data/vendas_sintetico.db"

RENOMEAR = {
    "Nota" : "nota",
    "Venda" : "pedido",
    "Emissão" : "emissao",
    "#" : "codigo_produto",
    "Descrição" : "descricao",
    "produto_base" : "produto_base",
    "Razão Social" : "cliente",
    "Nome Fantasia" : "nome_fantasia",
    "Cidade/UF" : "cidade_uf",
    "Vendedor" : "vendedor",
    "Qnt" : "quantidade",
    "Total" : "faturamento",
    "Total NF" : "valor_com_impostos",
}


def construir_silver(vendas):
    silver = vendas[list(RENOMEAR)].rename(columns=RENOMEAR)
    
    emissao = pd.to_datetime(silver["emissao"])
    silver["mes"] = emissao.dt.strftime("%Y-%m")
    silver["tipo"] = silver["faturamento"].apply(
        lambda valor: "cancelamento" if valor < 0 else "venda"
    )

    #QUANTIDADE FRACIONARIA EM PRODUTO VENDIDO POR UNIDADE INDICA ERRO DE ESCALA DO ERP
    silver["quantidade_suspeita"] = (silver["quantidade"] % 1!= 0).astype(int)

    return silver

if __name__ == "__main__":
    caminho_db = sys.argv[1] if len(sys.argv) > 1 else CAMINHO_DB
    conexao = sqlite3.connect(caminho_db)

    vendas = pd.read_sql_query("SELECT * FROM vendas", conexao)
    silver = construir_silver(vendas)
    silver.to_sql("silver_itens", conexao, if_exists="replace", index=False)

    conexao.close()
    print(f"silver_itens:{len(silver)} linhas gravadas")