# No padrão Page object model (POM) - Esse arquivo agrupa todas as bibliotecas (imports) e recursos (pages) utilizados pelos testes

*** Settings ***
Library    SeleniumLibrary     # Importa a biblioteca SeleniumLibrary para automação web
Library    FakerLibrary    locale=pt_BR    # Importa a biblioteca FakerLibrary para geração de massa de dados falsos para testes


Resource     shared/IO.robot     # Importa o arquivo IO.robot para reutilizar palavras-chave (keywords) e variáveis
Resource     pages/cadastro.robot     # Importa o arquivo cadastro.robot para reutilizar palavras-chave (keywords) e variáveis