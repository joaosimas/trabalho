#language: pt
@inserir_cliente_base
Funcionalidade: Inserir Cliente na Base
    Como uma API, quero mandar um post no endpoint e esse cliente precisa ser populado na base

Cenario: Inserir o cliente na base - Dados Corretos
    Dado que o Subscription chame uma rotina para inserir o cliente na base
    Quando os dados forem preenchidos corretamente
    Então o cliente vai ser inserido com sucesso
