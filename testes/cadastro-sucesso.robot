# No padrão Page Object Model (POM) esse arquivo representa a camada de testes, contendo os casos de teste enquanto importa as palavras-chave (keywords) e variáveis dos arquivos de recursos (resources) cadastro.robot e main.robot.

*** Settings ***  # Esse comando define as configurações do arquivo    
Resource  ../resources/main.robot  # Importa o arquivo main.robot para reutilizar palavras-chave (keywords) e variáveis
Test Setup    Dado que eu acesse o Organo  # Define a ação que será realizada antes de cada teste definida no base.robot
Test Teardown    Fechar o navegador  # Define a ação que será realizada após cada teste definida no base.robot


*** Test Cases ***  # Início da seção de casos de teste
Verificar se ao preencher os campos do formulário corretamento os dados são inseridos na lista e se um novo card é criado no time esperado  # Nome do caso de teste
    # Caso de teste escrito em Gherking que em cada linha chama as palavras-chave (keywords) que realizam as ações
    Dado que eu preencha os campos de formulário
    E clique no botão criar card
    Então indentificar se o card foi criado no time correto

Verificar se é possivel criar mais de um card se preencher os campos corretamente
    # Caso de teste escrito em Gherking que em cada linha chama as palavras-chave (keywords) que realizam as ações
    Dado que eu preencha os campos de formulário
    E clique no botão criar card
    Então identificar 3 cards no time esperado

Verificar se é possivel criar um card para cada time disponivel se preencher os campos corretamente 
    Dado que eu preencha os campos de formulário
    Então criar e identificar um card em cada time disponivel 


