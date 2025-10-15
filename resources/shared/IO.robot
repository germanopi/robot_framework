
# Esse arquivo contem as keywords que serão utilizadas antes e após cada teste
*** Settings ***  # Esse comando define as configurações do arquivo    
Resource  ../main.robot  # Importa o arquivo main.robot para reutilizar palavras-chave (keywords) e variáveis os . servem para sair da pasta atual e .. para voltar outra pasta

*** Keywords ***  # Início da seção de palavras-chave (keywords)
Dado que eu acesse o Organo 
    Open Browser  url=http://localhost:3000/  browser=chrome  # Abre o navegador Chrome e acessa o site do Organo

Fechar o navegador
    Close Browser  # Fecha o navegador aberto