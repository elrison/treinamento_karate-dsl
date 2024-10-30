Feature: Metodo para cadastrar usuarios
  Background:
    * url url
    * def resultado = karate.callSingle('classpath:feature/usuarios/generateEmail.feature')

  Scenario: Cadastrar usuario com sucesso com body no corpo do teste
    * def body =
          """
          {
              "nome": "Maria da Silva",
              "email": "#(resultado.email)",
              "password": "teste",
              "administrador": "true"
          }
          """
    Given path '/usuarios'
    And request body
    When method Post
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"

  Scenario: Cadastrar usuario com sucesso com body em arquivo
    * def now = function(){ return java.lang.System.currentTimeMillis()}

    * def body = read('classpath:/jsons/usuario.json')

    * set body.nome = 'maria'
    * set body.email = 'maria'+now()+'@qa.com.br'
    * set body.password = '123456'
    * set body.administrador = 'false'

    Given path '/usuarios'
    And request body
    When method Post
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"



