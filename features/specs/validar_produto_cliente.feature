#language: pt
@validar_produto_cliente
Funcionalidade: Validar se o cliente já tem o produto que está tentando comprar
    Como uma API, quero saber quando o cliente já tem o produto que estou tentando contratar

Cenario: Com produto ativo na base - msisdn
    Dado que eu acesse o endoint v1/main/subscribe/msisdn/{msisdn}/productID/{produto}
    Quando a consulta for por msisdn e o cliente já tiver o plano
    Entao ele vai tomar um 200 informando que o msisdn dele possui plano ativo 
    E quando esse endpoint estiver integrado ao sistema, o cliente vai ser notificado que não pode contratar outro plano Hero pois já possui 1 plano ativo


Cenario: Sem produto ativo na base - msisdn
    Dado que eu acesse o endoint v1/main/subscribe/msisdn/{msisdn}/productID/{produto}
    Quando a consulta for por msisdn e o cliente não tiver nenhum plano hero ativo
    Então ele vai tomar um 404 por não ter plano ativo, dessa forma ele esta apto a contratar um plano


Cenario: Com produto ativo na base - cpf
    Dado que eu acesse o endoint v1/main/subscribe/cpf/{cpf}/productID/{produto}
    Quando a consulta for por cpf e o cliente já tiver o plano
    Então ele vai tomar um 200 informando que o cpf dele possui plano ativo 
    E quando esse endpoint estiver integrado ao sistema, o cliente vai ser notificado que não pode contratar outro plano Hero pois já possui 1 plano ativo

Cenario: Sem produto ativo na base - cpf
    Dado que eu acesse o endoint v1/main/subscribe/cpf/{cpf}/productID/{produto}
    Quando a consulta for por cpf e o cliente não tiver nenhum plano hero ativo
    Então ele vai tomar um 404 por não ter plano ativo, dessa forma ele esta apto a contratar um plano