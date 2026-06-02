import requests
from requests.auth import HTTPBasicAuth

URL = "http://localhost:2480/api/v1/command/RecomandacaoFilmes"
AUTH = HTTPBasicAuth("root", "playwithdata")


def executar_sql(sql):
    resposta = requests.post(
        URL,
        auth=AUTH,
        json={
            "language": "sql",
            "command": sql
        }
    )

    if resposta.status_code != 200:
        print("Erro:", resposta.status_code)
        print(resposta.text)
        return None

    return resposta.json()
