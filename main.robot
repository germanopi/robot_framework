*** Settings ***  # Esse comando define as configurações do arquivo    
Library  SeleniumLibrary  # Importa a biblioteca SeleniumLibrary para automação web

*** Keywords ***  # Início da seção de palavras-chave (keywords)
Dado que eu acesse o Organo 
    Open Browser  url=http://localhost:3000/  browser=chrome  # Abre o navegador Chrome e acessa o site do Organo

Fechar o navegador
    Close Browser  # Fecha o navegador aberto