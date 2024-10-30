Feature: Atualizar um usuario cadastrado

  Background:
    * url 'http://localhost:3000'

  Scenario: Atualizar um usuario com sucesso
    * def usuarioCadastrado = call read('usuariosPut.feature@cadastrar')
    * def usuarioId = usuarioCadastrado.usuarioId
    * print 'ID do usuário cadastrado:', usuarioId

    * def now = function(){ return java.lang.System.currentTimeMillis() }
    * def emailAtualizado = 'maria.atualizada' + now() + '@qa.com.br'

    Given path '/usuarios/' + usuarioId
    * def body =
    """
    {
      "nome": "Maria Atualizada",
      "email": "#(emailAtualizado)",
      "password": "123456",
      "administrador": "true"
    }
    """
    And request body
    When method Put
    Then status 200
    And match response.message == "Registro alterado com sucesso"

  @ignore
  @cadastrar
  Scenario: Cadastrar para atualizar
    * def now = function(){ return java.lang.System.currentTimeMillis() }
    * def email = 'maria' + now() + '@qa.com.br'

    * def body =
    """
    {
      "nome": "Maria",
      "email": "#(email)",
      "password": "123456",
      "administrador": "false"
    }
    """

    Given path '/usuarios'
    And request body
    When method Post
    Then status 201
    * def usuarioId = response._id
    * match usuarioId != null
    * karate.set('usuarioId', usuarioId)
