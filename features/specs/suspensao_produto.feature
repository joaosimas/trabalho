#language: pt
@suspensao_reativacao_produto
Funcionalidade: Suspensao
	Como uma API, quando eu chamar o endpoint de suspensao, quero que a suspensao seja realizada com sucesso

Esquema do Cenario: Suspender/Reativar Produto - passando o product id - VIVO

 	Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, <la>, quando vier o procuct id <fsProductId> e <partner>
  	Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar e o msisdn for vivo
	Então a suspensao/reativacao será realizada apenas para o produto solicitado da operadora vivo

	Exemplos:
    |silent	|la 	|fsProductId                           |partner   |reason  |cancelar |action |
    |"false"|"10910"|"bc6a6513-384f-482b-966b-54ee601c97dc"|"vivo"    |"quero" |"sim"	 |"S"	 |
    |"true"	|"10910"|"bc6a6513-384f-482b-966b-54ee601c97dc"|"vivo"    |"talvez"|"sim"	 |"A"    |


Esquema do Cenario: Suspender/Reativar Produto - passando o product id - CLARO

    Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, <la>, quando vier o procuct id <fsProductId> e <partner>
    Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar e o msisdn for claro
    Então a suspensao/reativacao será realizada apenas para o produto solicitado da operadora claro

    Exemplos:
    |silent |la     |fsProductId                           |partner   |reason  |cancelar|action |
    |"false"|"10910"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"claro"   |"quero" |"sim"   |"S"    |
    |"true" |"10910"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"claro"   |"talvez"|"sim"   |"A"    |


Esquema do Cenario: Suspender/Reativar Produto - passando o product id - OI

    Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, <la>, quando vier o procuct id <fsProductId> e <partner>
    Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar e o msisdn for oi
    Então a suspensao/reativacao será realizada apenas para o produto solicitado da operadora oi

    Exemplos:
    |silent |la     |fsProductId                           |partner   |reason  |cancelar|action |
    |"false"|"10910"|"9a48e98f-8c3d-46d2-903b-cd643f999591"|"oi"      |"quero" |"sim"   |"S"    |
    |"true" |"10910"|"9a48e98f-8c3d-46d2-903b-cd643f999591"|"oi"      |"talvez"|"sim"   |"A"    |


Esquema do Cenario: Suspender/Reativar APENAS POR SUBSCRIPTION-ID(campo chave na tabela chaves) TIM

    Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, <la>, quando vier o procuct id <fsProductId> ee <partner>
    Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar e o msisdn for tim
    Então a suspensao/reativacao será realizada apenas para o msisdn solicitado da tim

    Exemplos:
    |silent |la     |fsProductId                           |partner   |reason  |cancelar|action |
    |"false"|"10910"|"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"tim"     |"quero" |"sim"   |"S"    |
    |"true" |"10910"|"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"tim"     |"talvez"|"sim"   |"A"    |


Esquema do Cenario: Suspender/Reativar SEM PASSAR o LA operadora claro -- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, sem passar o <la>, quando vier o procuct id <fsProductId> e <partner>
    Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar para claro
    Então a suspensao/reativacao será realizada para todos os la desse msisdn claro

    Exemplos:
    |silent |la     |fsProductId                           |partner   |reason  |cancelar|action |
    |"false"|""     |"5f386317-59fb-46b0-9620-a1edd50fa241"|"claro"   |"quero" |"sim"   |"S"    |


Esquema do Cenario: Suspender/Reativar SEM PASSAR o LA operadora vivo -- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, sem passar o <la>, quando vier o procuct id <fsProductId> e <partner>
    Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar para vivo
    Então a suspensao/reativacao será realizada para todos os la desse msisdn vivo

    Exemplos:
    |silent |la     |fsProductId                           |partner   |reason  |cancelar|action |
    |"true" |""     |"bc6a6513-384f-482b-966b-54ee601c97dc"|"vivo"    |"talvez"|"sim"   |"S"    |


Esquema do Cenario: Suspender/Reativar SEM PASSAR o LA operadora oi -- APENAS POR MSISDN

    Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, sem passar o <la>, quando vier o procuct id <fsProductId> e <partner>
    Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar para oi
    Então a suspensao/reativacao será realizada para todos os la desse msisdn oi

    Exemplos:
    |silent |la     |fsProductId                           |partner   |reason  |cancelar|action |
    |"false"|""     |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"oi"      |"quero" |"sim"   |"S"    |


Esquema do Cenario: Suspender/Reativar Produto - não passando o product id - TIM

    Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, <la>, quando não vier <fsProductId> e <partner>
    Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar e o msisdn da operação for tim
    Então a suspensao/reativacao será realizada para todos os produtos que o msisdn tim tiver

    Exemplos:
    |silent |la     |fsProductId|partner   |reason  |cancelar|action |
    |"false"|"10910"|""         |"tim"     |"quero" |"sim"   |"S"    |
    |"true" |"10910"|""         |"tim"     |"talvez"|"sim"   |"A"    |


Esquema do Cenario: Suspender/Reativar Produto - não passando o product id - VIVO

    Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, <la>, quando não vier <fsProductId> e <partner>
    Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar e o msisdn da operação for vivo
    Então a suspensao/reativacao será realizada para todos os produtos que o msisdn vivo tiver

    Exemplos:
    |silent |la     |fsProductId|partner   |reason  |cancelar|action |
    |"false"|"10910"|""         |"vivo"    |"quero" |"sim"   |"S"    |
    |"true" |"10910"|""         |"vivo"    |"talvez"|"sim"   |"A"    |


Esquema do Cenario: Suspender/Reativar Produto - não passando o product id - CARO

    Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, <la>, quando não vier <fsProductId> e <partner>
    Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar e o msisdn da operação for claro
    Então a suspensao/reativacao será realizada para todos os produtos que o msisdn claro tiver

    Exemplos:
    |silent |la     |fsProductId|partner   |reason  |cancelar|action |
    |"false"|"10910"|""         |"claro"   |"quero" |"sim"   |"S"    |
    |"true" |"10910"|""         |"claro"   |"talvez"|"sim"   |"A"    |


Esquema do Cenario: Suspender/Reativar Produto - não passando o product id - OI

    Dado que eu acesse o endpoint passando o <silent> para fazer a suspensao/reativacao, msisdn, <la>, quando não vier <fsProductId> e <partner>
    Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar e o msisdn da operação for oi
    Então a suspensao/reativacao será realizada para todos os produtos que o msisdn oi tiver

    Exemplos:
    |silent |la     |fsProductId|partner   |reason  |cancelar|action |
    |"false"|"10910"|""         |"oi"      |"quero" |"sim"   |"S"    |
    |"true" |"10910"|""         |"oi"      |"talvez"|"sim"   |"A"    |


Esquema do Cenario: Suspender/Reativar Produto - cenários negativos

 	Dado que eu acesse o endpoint passando os parametros errados <silent> para fazer a suspensao/reativacao, msisdn, <la>, <fsProductId> e <partner>
  	Quando eu passar o <reason>, <cancelar>, <action> vier S para suspender ou A para reativar e o <msisdn>
	Então a suspensao/reativacao não vai acontecer para produto nenhum

	Exemplos:
    |silent |msisdn          |la     |fsProductId                            |partner  |reason  |cancelar|action |
    |""     |"5511948574830" |"10910"|"bc6a6513-384f-482b-966b-54ee601c97dc" |"vivo"   |"quero" |"sim"   |"true" |
    |"true" |""              |"10910"|"9a48e98f-8c3d-46d2-903b-cd643f999591" |"oi"     |"talvez"|"sim"   |"false"|
    |"false"|"5511948574832" |"5513" |"5f386317-59fb-46b0-9620-a1edd50fa241" |"claro"  |"cansei"|"sim"   |"true" |
    |"true" |"5511948574833" |"10910"|""                                     |"tim"    |"agora" |"sim"   |"false"|
    |"false"|"5511948574834" |"10910"|"4"                                    |""       |"teste" |"sim"   |"S"    |
    |"true" |"5511948574835" |"10910"|"bc6a6513-384f-482b-966b-54ee601c97dc" |"vivo"   |"quero" |""      |"S"    |
    |"false"|"5511948574836" |"10910"|"bc6a6513-384f-482b-966b-54ee601c97dc" |"vivo"   |"quero" |"sim"   |""     |
    |"false"|"5511948574837" |"10910"|"bc6a6513-384f-482b-966b-54ee601c97dc" |"vivo"   |"quero" |"sim"   |"S"    |
