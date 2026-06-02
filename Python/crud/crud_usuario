from database.conexao import executar_sql


def tratar_texto_sql(texto):
    return texto.replace("'", "''")


def ler_texto(mensagem, nome_campo):
    while True:
        texto = input(mensagem).strip()

        if texto == "":
            print(f"{nome_campo} não pode ficar vazio.")
            continue

        return texto


def ler_email():
    while True:
        email = input("Digite o email do usuário: ").strip()

        if email == "":
            print("O email não pode ficar vazio.")
            continue

        if "@" not in email or "." not in email:
            print("Email inválido. Digite um email válido.")
            continue

        return email


def usuario_existe(username):
    username_sql = tratar_texto_sql(username)
    sql = f"SELECT FROM User WHERE username = '{username_sql}'"
    resultado = executar_sql(sql)

    return resultado and len(resultado.get("result", [])) > 0


def ler_usuario_existente(mensagem):
    while True:
        username = ler_texto(mensagem, "Nome do usuário")

        if usuario_existe(username):
            return username

        print("Usuário não encontrado. Tente novamente.")


def ler_usuario_inexistente(mensagem):
    while True:
        username = ler_texto(mensagem, "Nome do usuário")

        if not usuario_existe(username):
            return username

        print("Já existe um usuário com esse nome. Tente outro.")


def cadastrar_usuario():
    username = ler_usuario_inexistente("Digite o nome do usuário: ")
    email = ler_email()

    username_sql = tratar_texto_sql(username)
    email_sql = tratar_texto_sql(email)

    sql = f"INSERT INTO User SET username = '{username_sql}', email = '{email_sql}'"
    resultado = executar_sql(sql)

    if resultado:
        print("Usuário cadastrado com sucesso!")


def listar_usuarios():
    resultado = executar_sql("SELECT FROM User ORDER BY username")

    if resultado and "result" in resultado:
        print("\n=== LISTA DE USUÁRIOS ===")

        if len(resultado["result"]) == 0:
            print("Nenhum usuário cadastrado.")
            return

        for usuario in resultado["result"]:
            print(f"Nome: {usuario.get('username')} | Email: {usuario.get('email')}")


def atualizar_usuario():
    username = ler_usuario_existente("Digite o nome do usuário que deseja atualizar: ")

    novo_username = ler_texto("Digite o novo nome do usuário: ", "Nome do usuário")

    while novo_username != username and usuario_existe(novo_username):
        print("Já existe outro usuário com esse nome. Tente outro.")
        novo_username = ler_texto("Digite o novo nome do usuário: ", "Nome do usuário")

    novo_email = ler_email()

    username_sql = tratar_texto_sql(username)
    novo_username_sql = tratar_texto_sql(novo_username)
    novo_email_sql = tratar_texto_sql(novo_email)

    sql = f"UPDATE User SET username = '{novo_username_sql}', email = '{novo_email_sql}' WHERE username = '{username_sql}'"
    resultado = executar_sql(sql)

    if resultado:
        print("Usuário atualizado com sucesso!")


def deletar_usuario():
    username = ler_usuario_existente("Digite o nome do usuário que deseja deletar: ")

    username_sql = tratar_texto_sql(username)
    sql = f"DELETE FROM User WHERE username = '{username_sql}'"
    resultado = executar_sql(sql)

    if resultado:
        print("Usuário deletado com sucesso!")
