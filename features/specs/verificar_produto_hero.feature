#language: pt
@verificar_produto_hero
Funcionalidade: Verificar se o cliente tem outros produtos HERO
    Como uma API, quero saber quando o cliente tiver ou não um produto hero.

Cenario: Verificar produto hero por msisdn
    Dado que eu chame o v1/main/subscribe/msisdn/{msisdn}
    Quando o cliente tiver qualquer produto hero e for localizado por msisdn
    Então a consulta vai retornar 200 listando todos os produtos


Cenario: Verificar produto hero por msisdn inexistente
    Dado que eu chame o v1/main/subscribe/msisdn/{msisdn}
    Quando o cliente tiver qualquer produto hero mas a consulta for feita por um msisdn que nao exista
    Então vai ser retornado 404 - cliente nao encontrado


Cenario: Verificar produto hero por msisdn vazio
    Dado que eu chame o v1/main/subscribe/msisdn/{msisdn}
    Quando o cliente tiver qualquer produto hero mas não for passado o número do msisdn
    Então vai ser retornado 404 - Pagina nao encontrada


Cenario: Verificar produto hero por cpf
    Dado que eu chame o v1/main/subscribe/cpf/{cpf}
    Quando o cliente tiver qualquer produto hero e for localizado por cpf
    Então a consulta vai retornar 200 listando todos os produtos


Cenario: Verificar produto hero por cpf inexistente
    Dado que eu chame o v1/main/subscribe/cpf/{cpf}
    Quando o cliente tiver qualquer produto hero mas a consulta for feita por um cpf que nao exista
    Então vai ser retornado 404 - cliente nao encontrado


Cenario: Verificar produto hero por cpf vazio
    Dado que eu chame o v1/main/subscribe/cpf/{cpf}
    Quando o cliente tiver qualquer produto hero mas não for passado o número do cpf
    Então vai ser retornado 404 - Pagina nao encontrada


Cenario: Verificar produto hero por msisdn/cpf - passando um método não disponivel
    Dado que eu chame o v1/main/subscribe/msisdn/{msisdn} ou {cpf}
    Quando o cliente tiver qualquer produto hero mas a consulta for feita errada sendo passado o método PUT
    Então a consulta vai retornar 405 method not allowed