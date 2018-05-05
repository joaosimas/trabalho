#language: pt
@assinatura_oi
Funcionalidade: Assinatura OI
	Como uma API, quando eu chamar o endpoint de assinatura da oi passando o SILENT(true/false), LA 10910, PARCEIRO oi, MSISDN valido, FSPRODUCTID id de parceiro e CHANNEL 10910 - H com isso a assinatura será realizada com sucesso

Esquema do Cenario: Assinar oi

 	Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, <la>, <partner> oi e msisdn
  	Quando eu passar o <fsProductId> e <channel>
	Então o provisionamento será realizado com sucesso

	Exemplos:
    |silent	|la 	|partner|fsProductId                           |channel	   |
    |"false"|"10910"|"oi"   |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|
    |"true"	|"10910"|"oi"   |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|


Esquema do Cenario: Assinar oi - msisdn < que 13 digitos, msisdn > que 13 digitos e msisdn vazio

    Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, <la>, <partner> oi e msisdn
    Quando eu passar o <fsProductId>, <channel> e <msisdn_invalido> invalido
    Então o provisionamento não será realizado pois o msisdn tem que ser igual 13 caracteres

    Exemplos:
    |silent |la     |partner|msisdn_invalido  |fsProductId                           |channel    |
    |"false"|"10910"|"oi"   |"55113456789"    |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|
    |"true" |"10910"|"oi"   |"551175783532565"|"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|
    |"true" |"10910"|"oi"   |""               |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|


Esquema do Cenario: Assinar oi - Passando em silent a palavra "nada" ou vazio

    Dado que eu acesse o endpoint passando a palavra nada no parametro <silent>, <la>, <partner> e msisdn
    Quando eu passar o <fsProductId> e <channel>
    Então o provisionamento não vai ser realizado pois o silent só permite true/false

    Exemplos:
    |silent |la     |partner|fsProductId                           |channel    |
    |"nada" |"10910"|"oi"   |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|
    |""     |"10910"|"oi"   |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|


Esquema do Cenario: Assinar oi - Passando o la 881 ou vazio

    Dado que eu acesse o endpoint passando a palavra <silent>, <la> diferente de 10910, <partner> e msisdn
    Quando eu passar o <fsProductId> e <channel>
    Então o provisionamento não vai ser realizado pois único la que pode provisionar para a promo é 10910

    Exemplos:
    |silent |la     |partner|fsProductId                           |channel    |
    |"true" |"881"  |"oi"   |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|
    |"true" |""     |"oi"   |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|


Esquema do Cenario: Assinar oi - Passando o partner diferente de oi ou vazio

    Dado que eu acesse o endpoint passando a palavra <silent>, <la>, <partner> diferente de oi e msisdn
    Quando eu passar o <fsProductId> e <channel>
    Então o provisionamento não vai ser realizado pois o partner não pode ser diferente de oi

    Exemplos:
    |silent |la     |partner |fsProductId                           |channel    |
    |"true" |"10910"|"nextel"|"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|
    |"true" |"10910"|""      |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"10910 - H"|


Esquema do Cenario: Assinar oi - Passando o productid vazio

    Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, <la>, <partner> oi e msisdn
    Quando eu passar o <fsProductId> vazio e <channel>
    Então o provisionamento não vai ser realizado pois productid precisa existir

    Exemplos:
    |silent |la     |partner|fsProductId|channel    |
    |"false"|"10910"|"oi"   |""         |"10910 - H"|
    

Esquema do Cenario: Assinar oi - Passando o channel que não existe

    Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, <la>, <partner> oi e msisdn
    Quando eu passar o <fsProductId> e <channel> que não existe
    Então o provisionamento vai ser realizado pois channel não é validado

    Exemplos:
    |silent |la     |partner|fsProductId                           |channel    |
    |"true" |"10910"|"oi"   |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"687556556"|


Esquema do Cenario: Assinar oi - Passando sem o parametro la

    Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, sem o la, <partner> oi e msisdn
    Quando eu passar o <fsProductId> e <channel> que não existe
    Então o provisionamento não vai ser realizado pois la é obrigatório

    Exemplos:
    |silent |partner|fsProductId                           |channel    |
    |"true" |"oi"   |"9a48e98f-8c3d-46d2-903b-cd643f999591"|"687556556"|