from database.conexao import executar_sql
from crud.crud_filme import ler_filme_existente, tratar_texto_sql
from crud.crud_usuario import ler_usuario_existente


def watch_existe(username, titulo):
    username_sql = tratar_texto_sql(username)
    titulo_sql = tratar_texto_sql(titulo)

    sql = f"""
    SELECT FROM Watch 
    WHERE out IN (SELECT FROM User WHERE username = '{username_sql}')
    AND in IN (SELECT FROM Movie WHERE title = '{titulo_sql}')
    """

    resultado = executar_sql(sql)

    return resultado and len(resultado.get("result", [])) > 0


def registrar_filme_assistido():
    username = ler_usuario_existente("Digite o nome do usuário: ")
    titulo = ler_filme_existente("Digite o título do filme assistido: ")

    if watch_existe(username, titulo):
        print("Esse usuário já assistiu esse filme.")
        return

    username_sql = tratar_texto_sql(username)
    titulo_sql = tratar_texto_sql(titulo)

    sql = f"""
    CREATE EDGE Watch 
    FROM (SELECT FROM User WHERE username = '{username_sql}')
    TO (SELECT FROM Movie WHERE title = '{titulo_sql}')
    """

    resultado = executar_sql(sql)

    if resultado:
        print("Filme registrado como assistido com sucesso!")


def listar_historico_usuario():
    username = ler_usuario_existente("Digite o nome do usuário: ")
    username_sql = tratar_texto_sql(username)

    sql = f"""
    SELECT expand(out('Watch')) 
    FROM User 
    WHERE username = '{username_sql}'
    """

    resultado = executar_sql(sql)

    if resultado and "result" in resultado:
        print(f"\n=== HISTÓRICO DE {username.upper()} ===")

        if len(resultado["result"]) == 0:
            print("Esse usuário ainda não assistiu nenhum filme.")
            return

        for filme in resultado["result"]:
            print(f"Título: {filme.get('title')} | Ano: {filme.get('year')}")
