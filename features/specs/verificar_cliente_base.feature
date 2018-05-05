#language: pt
@verificar_cliente_base
Funcionalidade: Verificar Cliente na Base
    Como uma API, quero fazer um GET no endpoint através de msisdn e cpf e ambos precisam saber conversar e tratar caso exista algum parametro indevido.

Cenario: Verificar o cliente na base através do msisdn
    Dado que eu chame o /v1/customer/msisdn/{msisdn}
    Quando a consulta for por msisdn e o mesmo existir na base
    Então a consulta vai retornar 200 - com sucesso


Cenario: Verificar o cliente na base através do msisdn inexistente
    Dado que eu chame o /v1/customer/msisdn/{msisdn}
    Quando a consulta for por msisdn e o mesmo não existir na base
    Então a consulta vai retornar 404 - not found


Cenario: Verificar o cliente na base através do msisdn passando letras
    Dado que eu chame o /v1/customer/msisdn/{msisdn}
    Quando a consulta for por msisdn e o mesmo for uma string
    Então a consulta vai retornar 400 - só aceito número para o parametro msisdn


Cenario: Verificar o cliente na base através do cpf
    Dado que eu chame o /v1/customer/cpf/{cpf}
    Quando a consulta for por cpf e o mesmo existir na base
    Então a consulta vai retornar 200 - com sucesso


Cenario: Verificar o cliente na base através do cpf passando letras
    Dado que eu chame o /v1/customer/cpf/{cpf}
    Quando a consulta for por cpf e o mesmo não existir na base
    Então a consulta vai retornar 404 - not found


Cenario: Verificar o cliente na base através do cpf passando letras
    Dado que eu chame o /v1/customer/cpf/{cpf}
    Quando a consulta for por cpf e o mesmo for uma string
    Então a consulta vai retornar 400 - só aceito número para o parametro cpf


Cenario: Verificar o cliente na base através do msisdn/cpf - passando um delete no método
    Dado que eu chame o /v1/customer/msisdn/{msisdn}
    Quando a consulta for por msisdn e eu passar o método delete
    Então a consulta vai retornar 405 - method not allowed