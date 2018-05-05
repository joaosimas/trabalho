#language: pt
@assinatura_tim
Funcionalidade: Assinatura TIM
	Como uma API, quando eu chamar o endpoint de assinatura da TIM passando o SILENT(true/false), LA 10910, PARCEIRO tim, MSISDN valido, FSPRODUCTID id de parceiro, CHANNEL 10910 - H, APPLICATIONID string, SERVICEIsem o parametro partner tim e msisdn

Esquema do Cenario: Assinar TIM

 	Dado que eu acesse o endpoint passando o <silent> true e false para fazer o provisionamento, <la>, <partner> tim e msisdn
  	Quando eu passar o <fsProductId>, <channel>, <applicationid>, <serviceid>, <subscriptionid>
	Então o provisionamento será realizado com sucesso tanto para silent true quanto false

	Exemplos:
    |silent	|la 	|partner|fsProductId                           |channel	   |applicationid  |serviceid|subscriptionid|
    |"false"|"10910"|"tim"  |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"1234"	       |"abc"    |"45r"         |
    |"true"	|"10910"|"tim"  |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"4321"	       |"xpto"   |"8uu"         |


Esquema do Cenario: Assinar TIM - msisdn < que 13 digitos, msisdn > que 13 digitos e msisdn vazio

    Dado que eu acesse o endpoint passando o <silent> true e false para fazer o provisionamento, <la>, <partner> tim e msisdn
    Quando eu passar o <fsProductId>, <channel>, <applicationid>, <serviceid>, <subscriptionid> e <msisdn_invalido> invalido
    Então o provisionamento não será realizado pois o msisdn tem que ser igual 13 caracteres

    Exemplos:
    |silent |la     |partner|msisdn_invalido  |fsProductId                           |channel    |applicationid |serviceid|subscriptionid|
    |"false"|"10910"|"tim"  |"55113456789"    |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"1234"        |"abc"    |"45r"         |
    |"true" |"10910"|"tim"  |"551175783532554"|"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"4321"        |"xpto"   |"8uu"         |
    |"true" |"10910"|"tim"  |""               |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"4321"        |"xpto"   |"8uu"         |


Esquema do Cenario: Assinar TIM - Passando em silent a palavra "nada" ou vazio

    Dado que eu acesse o endpoint passando a palavra nada no parametro <silent>, <la>, <partner> tim e msisdn
    Quando eu passar o <fsProductId>, <channel>, <applicationid>, <serviceid>, <subscriptionid>
    Então o provisionamento não vai ser realizado pois o silent só permite true/false

    Exemplos:
    |silent |la     |partner|fsProductId                           |channel    |applicationid |serviceid|subscriptionid|
    |"nada" |"10910"|"tim"  |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"1234"        |"abc"    |"45r"         |
    |""     |"10910"|"tim"  |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"4321"        |"xpto"   |"8uu"         |


Esquema do Cenario: Assinar TIM - Passando o la 878 ou vazio

    Dado que eu acesse o endpoint passando a palavra <silent>, <la> diferente de 10910, <partner> tim e msisdn
    Quando eu passar o <fsProductId>, <channel>, <applicationid>, <serviceid>, <subscriptionid>
    Então o provisionamento não vai ser realizado pois único la que pode provisionar para a promo é 10910

    Exemplos:
    |silent |la     |partner|fsProductId                           |channel    |applicationid |serviceid|subscriptionid|
    |"false"|"878"  |"tim"  |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"1234"        |"abc"    |"45r"         |
    |"true" |""     |"tim"  |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"4321"        |"xpto"   |"8uu"         |


Esquema do Cenario: Assinar TIM - Passando o partner diferente de TIM ou vazio

    Dado que eu acesse o endpoint passando a palavra <silent>, <la>, <partner> diferente de tim e msisdn
    Quando eu passar o <fsProductId>, <channel>, <applicationid>, <serviceid>, <subscriptionid>
    Então o provisionamento não vai ser realizado pois o partner não pode ser diferente de tim

    Exemplos:
    |silent |la     |partner    |fsProductId                           |channel    |applicationid |serviceid|subscriptionid|
    |"false"|"10910"|"algar"    |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"1234"        |"abc"    |"45r"         |
    |"true" |"10910"|""         |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"10910 - H"|"4321"        |"xpto"   |"8uu"         |


Esquema do Cenario: Assinar TIM - Passando o productid vazio

    Dado que eu acesse o endpoint passando o <silent> true e false para fazer o provisionamento, <la>, <partner> tim e msisdn
    Quando eu passar o <fsProductId> vazio, <channel>, <applicationid>, <serviceid>, <subscriptionid>
    Então o provisionamento não vai ser realizado pois productid precisa existir

    Exemplos:
    |silent |la       |partner |fsProductId|channel    |applicationid |serviceid|subscriptionid|
    |"false"|"10910"  |"tim"   |""         |"10910 - H"|"1234"        |"abc"    |"45r"         |
    

Esquema do Cenario: Assinar TIM - Passando o channel que não existe

    Dado que eu acesse o endpoint passando o <silent> true e false para fazer o provisionamento, <la>, <partner> tim e msisdn
    Quando eu passar o <fsProductId>, <channel> inexistente, <applicationid>, <serviceid>, <subscriptionid>
    Então o provisionamento vai ser realizado pois channel não é validado

    Exemplos:
    |silent |la     |partner |fsProductId                           |channel    |applicationid |serviceid|subscriptionid|
    |"false"|"10910"|"tim"   |"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"eeeeeeeee"|"1234"        |"abc"    |"45r"         |



Esquema do Cenario: Assinar TIM - Passando sem o parametro partner

    Dado que eu acesse o endpoint passando o <silent> true e false para fazer o provisionamento, <la>, sem o parametro partner tim e msisdn
    Quando eu passar o <fsProductId>, <channel>, <applicationid>, <serviceid>, <subscriptionid> sem o partner
    Então o provisionamento não vai ser realizado pois o parametro partner é obrigatório

    Exemplos:
    |silent |la     |fsProductId                           |channel    |applicationid |serviceid|subscriptionid|
    |"false"|"10910"|"2bec115b-9405-472a-bdc9-1cd1f4b61054"|"eeeeeeeee"|"1234"        |"abc"    |"45r"         |