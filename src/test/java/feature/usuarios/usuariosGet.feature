Feature: Listar os usuarios cadastrados

  Background:
    * url url

   Scenario: Realizar a busca dos usuarios cadastrados
    Given path '/usuarios'
    When method Get
    Then status 200

  Scenario: Listar usuarios por nome
    Given path '/usuarios'
    And param nome =  'Silvana Farias'
    When method Get
    Then status 200

  Scenario: Listar usuario por nome e email
    Given path '/usuarios'
    And params {nome: 'Silvana Farias', email: 'silvanafarias@qa.com.br'}
    When method Get
    Then status 200

  Scenario: Listar usuario por nome e ID
    Given path '/usuarios'
    And params {nome: 'Elrison Silva', _id: 'FJ4FIBnHtjeO747P'}
    When method Get
    Then status 200

  Scenario: Listar usuario por nome e email e validar o nome do usuario retornado
    Given path '/usuarios'
    And params {nome: 'Maria da Silva', email: 'maria1730148298834@qa.com.br'}
    When method Get
    Then status 200
    And match response.usuarios[0].nome == 'Maria da Silva'

  Scenario: Listar usuario e verificar se algum usuario se chama Elrison Silva
    Given path '/usuarios'
    When method Get
    Then status 200
    And match response.usuarios..nome contains 'Elrison Silva'



  Scenario: Verificar o conteudo do response
    Given path '/usuarios'
    When method Get
    Then status 200
    And match response.quantidade != '#null'
    And match response.quantidade == '#number'