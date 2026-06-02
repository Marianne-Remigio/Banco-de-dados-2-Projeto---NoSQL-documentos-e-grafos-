from crud.crud_filme import cadastrar_filme, listar_filmes, atualizar_filme, deletar_filme
from crud.crud_usuario import cadastrar_usuario, listar_usuarios, atualizar_usuario, deletar_usuario
from watch.watch import registrar_filme_assistido, listar_historico_usuario
from recomendacao.recomendacao import recomendar_filmes

def menu_filmes():
    while True:
        print("\n=== CRUD FILMES ===")
        print("1 - Cadastrar filme")
        print("2 - Listar filmes")
        print("3 - Atualizar filme")
        print("4 - Deletar filme")
        print("5 - Recomendar filmes")
        print("0 - Voltar")

        opcao = input("Escolha uma opção: ")

        if opcao == "1":
            cadastrar_filme()
        elif opcao == "2":
            listar_filmes()
        elif opcao == "3":
            atualizar_filme()
        elif opcao == "4":
            deletar_filme()
        elif opcao == "5":
            recomendar_filmes()
        elif opcao == "0":
            break
        else:
            print("Opção inválida.")

def menu_usuarios():
    while True:
        print("\n=== CRUD USUÁRIOS ===")
        print("1 - Cadastrar usuário")
        print("2 - Listar usuários")
        print("3 - Atualizar usuário")
        print("4 - Deletar usuário")
        print("0 - Voltar")

        opcao = input("Escolha uma opção: ")

        if opcao == "1":
            cadastrar_usuario()
        elif opcao == "2":
            listar_usuarios()
        elif opcao == "3":
            atualizar_usuario()
        elif opcao == "4":
            deletar_usuario()
        elif opcao == "0":
            break
        else:
            print("Opção inválida.")

while True:
    print("\n=== SISTEMA DE RECOMENDAÇÃO DE FILMES ===")
    print("1 - Gerenciar filmes")
    print("2 - Gerenciar usuários")
    print("3 - Registrar filme assistido")
    print("4 - Ver histórico de usuário")
    print("0 - Sair")

    opcao = input("Escolha uma opção: ")

    if opcao == "1":
        menu_filmes()
    elif opcao == "2":
        menu_usuarios()
    elif opcao == "3":
        registrar_filme_assistido()
    elif opcao == "4":
        listar_historico_usuario()
    elif opcao == "0":
        print("Encerrando sistema...")
        break
    else:
        print("Opção inválida.")
