*** Settings ***  # Esse comando define as configurações do arquivo    
Library  SeleniumLibrary  # Importa a biblioteca SeleniumLibrary para automação web


*** Test Cases ***  # Início da seção de casos de teste
Abrir o navegador e acesse o site do organo  # Nome do caso de teste
    Open Browser  url=http://localhost:3000/  browser=chrome  # Abre o navegador Chrome e acessa o site do Organo
    
Preencher os campos do formulário  # Nome do caso de teste
    Input Text  id=form-nome    Pedro Ribero  # Preenche o campo "name" com o valor "Pedro Ribero"
    Input Text  id=form-cargo   Pjotinha  # Preenche o campo "cargo com o valor "Pjotinha"
    Input Text  id=form-imagem  https://picsum.photos/200/300   # Preenche o campo "imagem" com o a imagem do link  
    Click Element    class=lista-suspensa    # Clica no elemento com a classe lista suspensa que é o botão de seleção do time
    Click Element    //option[contains(.,'Programação')]    # Seleciona a opção "Programação" no menu suspenso do botão clicado
    Sleep    10s    # Pausa de 10 segundos para visualização
    Click Element    id=form-botao   # Clica no botão "Criar Card" para enviar o formulário
    Element Should Be Visible    class=colaborador
    Sleep    5s    # Pausa de 5 segundos para visualização