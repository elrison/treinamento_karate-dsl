Feature: Helper para gerar email único

  Scenario: Gerar email único para teste
    * def email = 'maria' + new Date().getTime() + '@qa.com.br'
    * karate.log('Email gerado:', email)
    * karate.set('email', email)
