*** Settings ***  # Esse comando define as configurações do arquivo    
Library  SeleniumLibrary  # Importa a biblioteca SeleniumLibrary para automação web
Resource  main.robot  # Importa o arquivo main.robot para reutilizar palavras-chave (keywords) e variáveis
Test Setup    Dado que eu acesse o Organo  # Define a ação que será realizada antes de cada teste
Test Teardown    Fechar o navegador  # Define a ação que será realizada após cada teste

*** Variables ***     # Inicio da seção de variáveis
${CAMPO_NOME}             id=form-nome               # Define a variável ${CAMPO_NOME}
${CAMPO_CARGO}            id=form-cargo              # Define a variável ${CAMPO_CARGO}
${CAMPO_IMAGEM}           id=form-imagem             # Define a variável ${CAMPO_IMAGEM}
${CAMPO_TIME}             class=lista-suspensa       # Define a variável ${CAMPO_TIME}
${BOTAO_CARD}             id=form-botao              # Define a variável ${BOTAO_CARD}
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]     # Define a variável ${OPCAO_PROGRAMACAO}
${OPCAO_FRONT}            //option[contains(.,'Front-End')]       # Define a variável ${OPCAO_FRONT}
${OPCAO_DADOS}            //option[contains(.,'Data Science')]    # Define a variável ${OPCAO_DADOS}
${OPCAO_DEVOPS}           //option[contains(.,'Devops')]          # Define a variável ${OPCAO_DEVOPS}
${OPCAO_UX}               //option[contains(.,'UX e Design')]     # Define a variável ${OPCAO_UX}
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]          # Define a variável ${OPCAO_MOBILE}
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]     # Define a variável ${OPCAO_INOVACAO}
${CARD_COLABORADOR}        class=colaborador


*** Test Cases ***  # Início da seção de casos de teste
Verificar se ao preencher os campos do formulário corretamento os dados são inseridos na lista e se um novo card é criado no time esperado  # Nome do caso de teste
    # Caso de teste escrito em Gherking que em cada linha chama as palavras-chave (keywords) que realizam as ações
    Dado que eu preencha os campos de formulário
    E clique no botão criar card
    Então indentificar se o card foi criado no time correto

*** Keywords ***  # Início da seção de palavras-chave (keywords)
    
Dado que eu preencha os campos de formulário
    Input Text  ${CAMPO_NOME}    Pedro Ribero  # Preenche o campo "name" com o valor "Pedro Ribero"
    Input Text  ${CAMPO_CARGO}   Pjotinha  # Preenche o campo "cargo com o valor "Pjotinha"
    Input Text  ${CAMPO_IMAGEM}  https://picsum.photos/200/300   # Preenche o campo "imagem" com o a imagem do link  
    Click Element    ${CAMPO_TIME}    # Clica no elemento com a classe lista suspensa que é o botão de seleção do time
    Click Element    ${OPCAO_PROGRAMACAO}    # Seleciona a opção "Programação" no menu suspenso do botão clicado
    Sleep    10s    # Pausa de 10 segundos para visualização
E clique no botão criar card
    Click Element    ${BOTAO_CARD}   # Clica no botão "Criar Card" para enviar o formulário
Então indentificar se o card foi criado no time correto
    Element Should Be Visible    ${CARD_COLABORADOR}