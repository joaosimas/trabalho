#language: pt
@assinatura_vivo
Funcionalidade: Assinatura VIVO
	Como uma API, quando eu chamar o endpoint de assinatura da vivo passando o SILENT(true/false), LA 10910, PARCEIRO vivo, MSISDN valido, FSPRODUCTID id de parceiro e CHANNEL 10910 - H com isso a assinatura será realizada com sucesso

Esquema do Cenario: Assinar vivo

 	Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, <la>, <partner> vivo e msisdn
  	Quando eu passar o <fsProductId> e <channel>
	Então o provisionamento será realizado com sucesso

	Exemplos:
    |silent	|la 	|partner  |fsProductId                           |channel	 |
    |"false"|"10910"|"vivo"   |"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|
    |"true"	|"10910"|"vivo"   |"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|


Esquema do Cenario: Assinar vivo - msisdn < que 13 digitos, msisdn > que 13 digitos e msisdn vazio

    Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, <la>, <partner> vivo e msisdn
    Quando eu passar o <fsProductId> e <channel> e for da regra <msisdn_invalido> invalido
    Então o provisionamento não será realizado pois o msisdn tem que ser igual 13 caracteres

    Exemplos:
    |silent |la     |partner  |msisdn_invalido  |fsProductId                           |channel    |
    |"false"|"10910"|"vivo"   |"55113456789"    |"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|
    |"true" |"10910"|"vivo"   |"551175783532565"|"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|
    |"true" |"10910"|"vivo"   |""               |"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|


Esquema do Cenario: Assinar vivo - Passando em silent a palavra "nada" ou vazio

    Dado que eu acesse o endpoint passando a palavra nada no parametro <silent>, <la>, <partner> e msisdn
    Quando eu passar o <fsProductId> e <channel>
    Então o provisionamento não vai ser realizado pois o silent só permite true/false

    Exemplos:
    |silent |la     |partner  |fsProductId                           |channel    |
    |"nada" |"10910"|"vivo"   |"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|
    |""     |"10910"|"vivo"   |"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|


Esquema do Cenario: Assinar vivo - Passando o la 881 ou vazio

    Dado que eu acesse o endpoint passando a palavra <silent>, <la> diferente de 10910, <partner> e msisdn
    Quando eu passar o <fsProductId> e <channel>
    Então o provisionamento não vai ser realizado pois único la que pode provisionar para a promo é 10910

    Exemplos:
    |silent |la     |partner  |fsProductId                           |channel    |
    |"true" |"881"  |"vivo"   |"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|
    |"true" |""     |"vivo"   |"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|


Esquema do Cenario: Assinar vivo - Passando o partner diferente de vivo ou vazio

    Dado que eu acesse o endpoint passando a palavra <silent>, <la>, <partner> diferente de vivo e msisdn
    Quando eu passar o <fsProductId> e <channel>
    Então o provisionamento não vai ser realizado pois o partner não pode ser diferente de vivo

    Exemplos:
    |silent |la     |partner |fsProductId                           |channel    |
    |"true" |"10910"|"nextel"|"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|
    |"true" |"10910"|""      |"bc6a6513-384f-482b-966b-54ee601c97dc"|"10910 - H"|


Esquema do Cenario: Assinar vivo - Passando o productid vazio

    Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, <la>, <partner> vivo e msisdn
    Quando eu passar o <fsProductId> vazio e <channel>
    Então o provisionamento não vai ser realizado pois productid precisa existir

    Exemplos:
    |silent |la     |partner  |fsProductId|channel    |
    |"false"|"10910"|"vivo"   |""         |"10910 - H"|
    

Esquema do Cenario: Assinar vivo - Passando o channel que não existe

    Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, <la>, <partner> vivo e msisdn
    Quando eu passar o <fsProductId> e <channel> que não existe
    Então o provisionamento vai ser realizado pois channel não é validado

    Exemplos:
    |silent |la     |partner|fsProductId                           |channel    |
    |"true" |"10910"|"vivo" |"bc6a6513-384f-482b-966b-54ee601c97dc"|"687556556"|


Esquema do Cenario: Assinar vivo - Passando sem o parametro fsProductId

    Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, <la>, <partner> vivo e msisdn
    Quando eu deixar de passar o parametro fsProductId e passar <channel>
    Então o provisionamento não vai ser realizado pois fsProductId é obrigatório

    Exemplos:
    |silent |la     |partner|channel    |
    |"true" |"10910"|"vivo" |"687556556"|