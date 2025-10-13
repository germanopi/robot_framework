*** Settings ***  # Esse comando define as configurações do arquivo    
Library  SeleniumLibrary  # Importa a biblioteca SeleniumLibrary para automação web
Resource  main.robot  # Importa o arquivo main.robot para reutilizar palavras-chave (keywords) e variáveis
Test Setup    Dado que eu acesse o Organo  # Define a ação que será realizada antes de cada teste definida no main.robot
Test Teardown    Fechar o navegador  # Define a ação que será realizada após cada teste definida no main.robot

*** Variables ***     # Inicio da seção de variáveis
${BOTAO_CARD}             id=form-botao              # Define a variável ${BOTAO_CARD}


*** Test Cases ***  # Início da seção de casos de teste
Verificar se quando um campo obrigatório não for preenchido corretamento o sistema exibe uma mensagem de campo obrigatório
    # Caso de teste escrito em Gherking que em cada linha chama as palavras-chave (keywords) que realizam as ações
    
    Dado que eu clique no botão criar card
    Então sistema deve apresentar mensagem de campo obrigatório

*** Keywords ***  # Início da seção de palavras-chave (keywords)
Dado que eu clique no botão criar card
    Click Element   ${BOTAO_CARD}   # Clica no botão "Criar Card" para enviar o formulário

Então sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    form-nome-erro       # Sem usar locator id porque só vai usar uma vez então escrito direto de forma estática
    Element Should Be Visible    form-cargo-erro       # Sem usar locator id porque só vai usar uma vez então escrito direto de forma estática
    Element Should Be Visible    form-times-erro       # Sem usar locator id porque só vai usar uma vez então escrito direto de forma estática
