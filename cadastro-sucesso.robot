*** Settings ***  # Esse comando define as configurações do arquivo    
Library  SeleniumLibrary  # Importa a biblioteca SeleniumLibrary para automação web 
Library  FakerLibrary  locale=pt_BR  # Importa a biblioteca FakerLibrary para geração de massa de dados falsos para testes
Resource  main.robot  # Importa o arquivo main.robot para reutilizar palavras-chave (keywords) e variáveis
Test Setup    Dado que eu acesse o Organo  # Define a ação que será realizada antes de cada teste definida no main.robot
Test Teardown    Fechar o navegador  # Define a ação que será realizada após cada teste definida no main.robot

*** Variables ***     # Inicio da seção de variáveis
${CAMPO_NOME}             id=form-nome               # Define a variável ${CAMPO_NOME}
${CAMPO_CARGO}            id=form-cargo              # Define a variável ${CAMPO_CARGO}
${CAMPO_IMAGEM}           id=form-imagem             # Define a variável ${CAMPO_IMAGEM}
${CAMPO_TIME}             class=lista-suspensa       # Define a variável ${CAMPO_TIME}
${BOTAO_CARD}             id=form-botao              # Define a variável ${BOTAO_CARD}
@{LISTA_DE_SELEÇÃO_DE_TIMES}                         # Define uma lista de variáveis para as opções do menu suspenso
...    //option[contains(.,'Programação')]     # Primeiro item da lista
...    //option[contains(.,'Front-End')]       # Segundo item da lista
...    //option[contains(.,'Data Science')]    # Terceiro item da lista
...    //option[contains(.,'Devops')]          # Quarto item da lista
...    //option[contains(.,'UX e Design')]     # Quinto item da lista
...    //option[contains(.,'Mobile')]          # Sexto item da lista
...    //option[contains(.,'Inovação e Gestão')]     # Define a variável ${OPCAO_INOVACAO}
${CARD_COLABORADOR}        class=colaborador


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

*** Keywords ***  # Início da seção de palavras-chave (keywords)
    
Dado que eu preencha os campos de formulário
    ${VARIAVEL_LOCAL_NOME}     FakerLibrary.First Name   # Gera um nome falso e armazena na variável ${VARIAVEL_LOCAL_NOME}
    Input Text  ${CAMPO_NOME}    ${VARIAVEL_LOCAL_NOME}  # Preenche o campo "name" com o valor da variável ${VARIAVEL_LOCAL_NOME}
    ${VARIAVEL_LOCAL_CARGO}     FakerLibrary.Job    # Gera um cargo falso e armazena na variável ${VARIAVEL_LOCAL_CARGO}
    Input Text  ${CAMPO_CARGO}   ${VARIAVEL_LOCAL_CARGO}  # Preenche o campo "cargo com o valor da variável ${VARIAVEL_LOCAL_CARGO}
    ${VARIAVEL_LOCAL_IMAGEM}    FakerLibrary.Image Url     # Gera uma URL de imagem falsa e armazena na variável ${VARIAVEL_LOCAL_IMAGEM}
    Input Text  ${CAMPO_IMAGEM}  ${VARIAVEL_LOCAL_IMAGEM}   # Preenche o campo "imagem" com o a imagem do link  
    Click Element    ${CAMPO_TIME}    # Clica no elemento com a classe lista suspensa que é o botão de seleção do time
    Click Element    ${LISTA_DE_SELEÇÃO_DE_TIMES}[0]   # Seleciona a primeira opção "Programação" no menu suspenso do botão clicado, utilizando uma lista de opções
    # Click Element    ${OPCAO_PROGRAMACAO}    # Seleciona a opção "Programação" no menu suspenso do botão clicado, sem utilizar uma lista de opções 
    # Input Text  ${CAMPO_NOME}    Pedro Ribero  # Preenche o campo "name" com o valor "Pedro Ribero" manualmente sem massa de dados
    # Input Text  ${CAMPO_CARGO}   Pjotinha  # Preenche o campo "cargo com o valor "Pjotinha" manualmente sem massa de dados
    # Input Text  ${CAMPO_IMAGEM}  https://picsum.photos/200/300   # Preenche o campo "imagem" com o a imagem do link   manualmente sem massa de dados
    # Sleep    10s    # Pausa de 10 segundos para visualização
E clique no botão criar card
    Click Element    ${BOTAO_CARD}   # Clica no botão "Criar Card" para enviar o formulário
Então indentificar se o card foi criado no time correto
    Element Should Be Visible    ${CARD_COLABORADOR}

Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1   3      # Loop para repetir a ação 3 vezes
            Dado que eu preencha os campos de formulário
            E clique no botão criar card
    END

Então criar e identificar um card em cada time disponivel  
    FOR    ${indice}    ${time}    IN ENUMERATE    @{LISTA_DE_SELEÇÃO_DE_TIMES}     # Loop para iterar sobre a lista de opções de times
        Dado que eu preencha os campos de formulário
        Click Element    ${time}     # Clica na opção do time atual no loop 
        E clique no botão criar card
    END
