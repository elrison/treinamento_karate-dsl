Feature: Deletar um usuario cadastrado da lista

  Background:
    * url url

  Scenario: Deletar um usuario com sucesso
    * def id = call read('usuariosDelete.feature@cadastrar')

    Given path '/usuarios/'+id.usuarioID
    When method Delete
    Then status 200
    And match response.message == "Registro excluído com sucesso"

  @ignore
  @cadastrar
  Scenario: Cadastrar usuario para deletar
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
    * def usuarioID = response._id
    * print usuarioID