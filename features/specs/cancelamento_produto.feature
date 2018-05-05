#language: pt
@cancelamento_produto
Funcionalidade: Cancelamento
	Como uma API, quando eu chamar o endpoint de cancelamento, quero que o cancelamento seja realizado com sucesso

Esquema do Cenario: Cancelar Produto vivo -- APENAS POR MSISDN

 	Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento, <la>, <fsProductId>e <partner>
  	Quando os parametros da vivo forem passados corretamente <reason>, <cancelar> e <force>
	Então o cancelamento será realizado com sucesso pelo msisdn do cliente vivo

	Exemplos:
    |silent	|la 	|fsProductId                           |partner  |reason  |cancelar |force	|
    |"false"|"10910"|"bc6a6513-384f-482b-966b-54ee601c97dc"|"vivo"   |"quero" |"sim"	|"true"	|
    |"true"	|"10910"|"bc6a6513-384f-482b-966b-54ee601c97dc"|"vivo"   |"talvez"|"sim"	|"false"|
    |"true" |"10910"|"bc6a6513-384f-482b-966b-54ee601c97dc"|"vivo"   |"talvez"|"sim"    |""     |


Esquema do Cenario: Cancelar Produto oi -- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento, <la>, <fsProductId>e <partner>
    Quando os parametros da oi forem passados corretamente <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso pelo msisdn do cliente oi

    Exemplos:
    |silent |la     |fsProductId                            |partner  |reason  |cancelar|force  |
    |"false"|"10910"|"9a48e98f-8c3d-46d2-903b-cd643f999591" |"oi"     |"quero" |"sim"   |"true" |
    |"true" |"10910"|"9a48e98f-8c3d-46d2-903b-cd643f999591" |"oi"     |"talvez"|"sim"   |"false"|
    |"true" |"10910"|"9a48e98f-8c3d-46d2-903b-cd643f999591" |"oi"     |"talvez"|"sim"   |""     |


Esquema do Cenario: Cancelar Produto claro -- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento, <la>, <fsProductId>e <partner>
    Quando os parametros da claro forem passados corretamente <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso pelo msisdn do cliente claro

    Exemplos:
    |silent |la     |fsProductId                            |partner  |reason  |cancelar|force  |
    |"false"|"10910"|"5f386317-59fb-46b0-9620-a1edd50fa241" |"claro"  |"quero" |"sim"   |"true" |
    |"true" |"10910"|"5f386317-59fb-46b0-9620-a1edd50fa241" |"claro"  |"talvez"|"sim"   |"false"|
    |"true" |"10910"|"5f386317-59fb-46b0-9620-a1edd50fa241" |"claro"  |"talvez"|"sim"   |""     |


Esquema do Cenario: Cancelar Produto SEM PASSAR o LA operadora claro-- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento, sem passar o <la>, <fsProductId>e <partner>
    Quando os parametros forem passados corretamente para cancelar claro sem passar la <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso para qualquer la desse msisdn claro

    Exemplos:
    |silent |la     |fsProductId                            |partner  |reason  |cancelar|force  |
    |"false"|""     |"5f386317-59fb-46b0-9620-a1edd50fa241" |"claro"  |"quero" |"sim"   |"true" |


Esquema do Cenario: Cancelar Produto SEM PASSAR o LA operadora vivo-- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento, sem passar o <la>, <fsProductId>e <partner>
    Quando os parametros forem passados corretamente para cancelar vivo sem passar la <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso para qualquer la desse msisdn vivo

    Exemplos:
    |silent |la     |fsProductId                            |partner  |reason  |cancelar|force  |
    |"true" |""     |"bc6a6513-384f-482b-966b-54ee601c97dc" |"vivo"   |"talvez"|"sim"   |"false"|


Esquema do Cenario: Cancelar Produto SEM PASSAR o LA operadora oi-- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento, sem passar o <la>, <fsProductId>e <partner>
    Quando os parametros forem passados corretamente para cancelar oi sem passar la <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso para qualquer la desse msisdn oi

    Exemplos:
    |silent |la     |fsProductId                            |partner  |reason  |cancelar|force  |
    |"true" |""     |"9a48e98f-8c3d-46d2-903b-cd643f999591" |"oi"     |"talvez"|"sim"   |"false"|


Esquema do Cenario: Cancelar Produto SEM PASSAR o fsProductId da operadora claro -- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento, <la>, sem passar o <fsProductId>e <partner>
    Quando os parametros forem passados corretamente para cancelar claro sem product_id <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso para qualquer fsProductId desse msisdn claro

    Exemplos:
    |silent |la     |fsProductId|partner  |reason  |cancelar|force  |
    |"false"|"10910"|""         |"claro"  |"quero" |"sim"   |"true" |


Esquema do Cenario: Cancelar Produto SEM PASSAR o fsProductId da operadora vivo -- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento, <la>, sem passar o <fsProductId>e <partner>
    Quando os parametros forem passados corretamente para cancelar vivo sem product_id <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso para qualquer fsProductId desse msisdn vivo

    Exemplos:
    |silent |la     |fsProductId|partner  |reason  |cancelar|force  |
    |"true" |"10910"|""         |"vivo"   |"talvez"|"sim"   |"false"|


Esquema do Cenario: Cancelar Produto SEM PASSAR o fsProductId da operadora oi -- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento, <la>, sem passar o <fsProductId>e <partner>
    Quando os parametros forem passados corretamente para cancelar oi sem product_id <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso para qualquer fsProductId desse msisdn oi

    Exemplos:
    |silent |la     |fsProductId|partner  |reason  |cancelar|force  |
    |"true" |"10910"|""         |"oi"     |"talvez"|"sim"   |"true" |


Esquema do Cenario: Cancelar Produto tim -- APENAS POR SUBSCRIPTION-ID(campo chave na tabela chaves)

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento da tim, <la>, <fsProductId>e <partner>
    Quando for tim e eu passar os paramentros <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso pelo campo chaves da tabela chaves

    Exemplos:
    |silent  |la     |fsProductId                           |partner  |reason  |cancelar|force  |
    |"true"  |"10910"|"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"tim"    |"agora" |"sim"   |"false"|
    |"false" |"10910"|"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"tim"    |"teste" |"nao"   |"true" |
    |"false" |"10910"|"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"tim"    |"teste" |"nao"   |""     |


Esquema do Cenario: Cancelar Produto tim -- APENAS POR SUBSCRIPTION- SEM PASSAR LA(campo chave na tabela chaves)

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento da tim sem o la, <la>, <fsProductId>e <partner>
    Quando for tim e eu passar os paramentros <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso pelo campo chaves da tabela chaves para todos os las desse msisdn

    Exemplos:
    |silent  |la     |fsProductId                           |partner  |reason  |cancelar|force  |
    |"true"  |""     |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"tim"    |"agora" |"sim"   |"false"|


Esquema do Cenario: Cancelar Produto tim -- APENAS POR SUBSCRIPTION- SEM PASSAR fsPRODUCTID(campo chave na tabela chaves)

    Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento da tim sem passar o product_id, <la>, <fsProductId> e <partner>
    Quando for tim e eu passar os paramentros <reason>, <cancelar> e <force>
    Então o cancelamento será realizado com sucesso pelo campo chaves da tabela chaves para todos os products_ids desse msisdn

    Exemplos:
    |silent  |la     |fsProductId|partner  |reason  |cancelar|force  |
    |"false" |"10910"|""         |"tim"    |"teste" |"nao"   |"true" |


Esquema do Cenario: Cancelar Produto - cenários negativos

 	Dado que eu acesse o endpoint passando o <silent> para fazer o cancelamento, <la>, <fsProductId>e <partner>
  	Quando os parametros estiverem errados <reason>, <cancelar>, <force> e <identifier>
	Então o cancelamento não será realizado com sucesso

	Exemplos:
	|silent	|identifier        |la 	   |fsProductId                            |partner  |reason  |cancelar |force	|  
    |""		|"1195647586001"   |"10910"|"bc6a6513-384f-482b-966b-54ee601c97dc" |"vivo"   |"quero" |"sim"	|"true"	|
    |"asdf"	|"1195647586002"   |"10910"|"9a48e98f-8c3d-46d2-903b-cd643f999591" |"oi"  	 |"talvez"|"sim"	|"false"|
    |"false"|"1195647586"      |"10910"|"5f386317-59fb-46b0-9620-a1edd50fa241" |"claro"  |"cansei"|"sim"	|"true" |
    |"true"	|"119564758695454" |"10910"|"2bec115b-9405-472a-bdc9-1cd1f4b61054" |"tim"    |"agora" |"sim"	|"false"|
    |"false"|""                |"10910"|"5f386317-59fb-46b0-9620-a1edd50fa241" |"claro"  |"cansei"|"sim"	|"true" |
    |"true"	|"1195647586004"   |"878"  |"2bec115b-9405-472a-bdc9-1cd1f4b61054" |"tim"  	 |"talvez"|"sim"	|"false"|
    |"false"|"1195647586007"   |"10910"|"4"	                                   |"algar"  |"teste" |"sim"	|"true"	|
    |"true"	|"1195647586008"   |"10910"|"2"	                                   |""  	 |"joao"  |"sim"	|"false"|
    |"true" |"1195647586004"   |"10910"|"2bec115b-9405-472a-bdc9-1cd1f4b61054" |"tim"    |""      |"sim"    |"false"|
    |"true" |"1195647586004"   |"10910"|"2bec115b-9405-472a-bdc9-1cd1f4b61054" |"tim"    |"test"  |""       |"false"|