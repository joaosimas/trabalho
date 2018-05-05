#language: pt
@assinatura_claro
Funcionalidade: Assinatura Claro
	Como uma API, quando eu chamar o endpoint de assinatura da claro passando o SILENT(true/false), LA 10910, PARCEIRO claro, MSISDN valido, FSPRODUCTID id de parceiro, CHANNEL 10910 - H, AUTHCODE númerico, TRANSACTIONAUTH string, com isso a assinatura será realizada com sucesso

Esquema do Cenario: Assinar claro
    
Dado que eu acesse o endpoint passando o <silent> false para fazer o provisionamento, <la>, <partner> e msisdn
  	Quando eu passar o <fsProductId>, <channel>, <authCode> e <transactionIdAuth>
	Então o provisionamento será realizado com sucesso

	Exemplos:
    |silent	|la 	|partner|fsProductId                           |channel	   |authCode |transactionIdAuth|
    |"false"|"10910"|"claro"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"1234"	 |"abc"			   |
    |"true"	|"10910"|"claro"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4321"	 |"xpto"	       |


Esquema do Cenario: Assinar claro - msisdn < que 13 digitos, msisdn > que 13 digitos e msisdn vazio

    Dado que eu acesse o endpoint passando o <silent> false para fazer o provisionamento, <la>, <partner> e msisdn
    Quando eu passar o <fsProductId>, <channel>, <authCode> e <transactionIdAuth> e fora da regra o <msisdn_invalido>
    Então o provisionamento não será realizado pois o msisdn tem que ser igual 13 caracteres

    Exemplos:
    |silent |la     |partner|msisdn_invalido   |fsProductId                           |channel    |authCode|transactionIdAuth|
    |"false"|"10910"|"claro"|"5511374859405746"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"1234"  |"abc"            |
    |"true" |"10910"|"claro"|"551137485"       |"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4321"  |"xpto"           |
    |"true" |"10910"|"claro"|""                |"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4321"  |"xpto"           |


Esquema do Cenario: Assinar claro - Passando em silent a palavra "nada" ou vazio

    Dado que eu acesse o endpoint passando a palavra nada no parametro <silent>, <la>, <partner> e msisdn
    Quando eu passar o <fsProductId>, <channel>, <authCode> e <transactionIdAuth>
    Então o provisionamento não vai ser realizado pois o silent só permite true/false

    Exemplos:
    |silent |la     |partner|fsProductId                           |channel    |authCode|transactionIdAuth|
    |"nada" |"10910"|"claro"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4463"  |"teg"            |
    |""     |"10910"|"claro"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4463"  |"teg"            |


Esquema do Cenario: Assinar claro - Passando o la 881 ou vazio

    Dado que eu acesse o endpoint passando a palavra <silent>, <la> diferente de 10910, <partner> e msisdn
    Quando eu passar o <fsProductId>, <channel>, <authCode> e <transactionIdAuth>
    Então o provisionamento não vai ser realizado pois único la que pode provisionar para a promo é 10910

    Exemplos:
    |silent |la     |partner|fsProductId                           |channel    |authCode|transactionIdAuth|
    |"true" |"881"  |"claro"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"8978"  |"gfds"           |
    |"true" |""     |"claro"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"8978"  |"gfds"           |


Esquema do Cenario: Assinar claro - Passando o partner diferente de claro ou vazio

    Dado que eu acesse o endpoint passando a palavra <silent>, <la>, <partner> diferente de claro e msisdn
    Quando eu passar o <fsProductId>, <channel>, <authCode> e <transactionIdAuth>
    Então o provisionamento não vai ser realizado pois o partner não pode ser diferente de claro

    Exemplos:
    |silent |la     |partner|fsProductId                           |channel    |authCode|transactionIdAuth|
    |"true" |"10910"|"rtyty"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"3324"  |"566"            |
    |"true" |"10910"|""     |"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"3324"  |"566"            |


Esquema do Cenario: Assinar claro - Passando o productid vazio

    Dado que eu acesse o endpoint passando o <silent> false para fazer o provisionamento, <la>, <partner> e msisdn
    Quando eu passar o <fsProductId> vazio, <channel>, <authCode> e <transactionIdAuth>
    Então o provisionamento não vai ser realizado pois productid precisa existir

    Exemplos:
    |silent |la     |partner|fsProductId|channel    |authCode|transactionIdAuth|
    |"false"|"10910"|"claro"|""         |"10910 - H"|"3324"  |"566"            |
    

Esquema do Cenario: Assinar claro - Passando o channel que não existe

    Dado que eu acesse o endpoint passando o <silent> false para fazer o provisionamento, <la>, <partner> e msisdn
    Quando eu passar o <fsProductId>, <channel> que não existe, <authCode> e <transactionIdAuth>
    Então o provisionamento vai ser realizado pois channel não é validado

    Exemplos:
    |silent |la     |partner|fsProductId                           |channel    |authCode|transactionIdAuth|
    |"true" |"10910"|"claro"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"687556556"|"3324"  |"566"            |


Esquema do Cenario: Assinar claro - Passando sem o parametro msisdn

    Dado que eu acesse o endpoint passando o <silent> para fazer o provisionamento, <la>, <partner> claro e sem o parametro msisdn
    Quando eu passar o <fsProductId>, <channel>, <authCode> e <transactionIdAuth> com a ausencia do msisdn
    Então o provisionamento não vai ser realizado pois msisdn é obrigatório

    Exemplos:
    |silent |la     |partner|fsProductId                            |channel     |authCode|transactionIdAuth|
    |"false"|"10910"|"claro"|"5f386317-59fb-46b0-9620-a1edd50fa241" |"10910 - H" |"3324"  |"566"            |