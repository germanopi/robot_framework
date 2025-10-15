# No padrão Page Object Model (POM) esse arquivo representa a camada de testes, contendo os casos de teste enquanto importa as palavras-chave (keywords) e variáveis dos arquivos de recursos (resources) cadastro.robot e main.robot.

*** Settings ***  # Esse comando define as configurações do arquivo    
Resource  ../resources/main.robot  # Importa o arquivo main.robot para reutilizar palavras-chave (keywords) e variáveis
Test Setup    Dado que eu acesse o Organo  # Define a ação que será realizada antes de cada teste definida no main.robot
Test Teardown    Fechar o navegador  # Define a ação que será realizada após cada teste definida no main.robot

*** Test Cases ***  # Início da seção de casos de teste
Verificar se quando um campo obrigatório não for preenchido corretamento o sistema exibe uma mensagem de campo obrigatório
    # Caso de teste escrito em Gherking que em cada linha chama as palavras-chave (keywords) que realizam as ações
    
    Dado que eu clique no botão criar card
    Então sistema deve apresentar mensagem de campo obrigatório

