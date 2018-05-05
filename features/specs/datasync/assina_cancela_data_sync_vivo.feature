#language: pt
@data_sync_vivo @datasync
Funcionalidade: Data Sync Vivo
	Com um serviço que vai passar informação para o Subscription, preciso que as informações venham corretas
    para que a assinatura seja realizada.

Esquema do Cenario: Data Sync Vivo - dados corretos - update type 0

 	Dado que o callback do gateway retorne a opção de compra correta para o <la> 10910
  	Quando o <updateType> vier 0, <service_id> e <product_id>
	Então a assinatura vivo deverá ser realizada com sucesso

	Exemplos:
    |la 	|updateType|service_id     |product_id |
    |"10910"|"0"       |"0123456789"   |"754544544"|


Esquema do Cenario: Data Sync Vivo - dados corretos - update type 1

    Dado que o callback do gateway retorne a opção de compra correta para o <la> 10910
    Quando o <updateType> vier 1, <service_id> e <product_id>
    Então a assinatura vivo deverá ser realizada com sucesso

    Exemplos:
    |la     |updateType|service_id     |product_id |
    |"10910"|"1"       |"0123456789"   |"754544544"|


Esquema do Cenario: Data Sync Vivo - dados corretos - update type 2

    Dado que o callback do gateway retorne a opção de compra correta para o <la> 10910
    Quando o <updateType> vier 2, <service_id> e <product_id>
    Então a assinatura vivo deverá ser realizada com sucesso

    Exemplos:
    |la     |updateType|service_id     |product_id |
    |"10910"|"2"       |"0123456789"   |"754544544"|


Esquema do Cenario: Data Sync Vivo - dados corretos - update type 3

    Dado que o callback do gateway retorne a opção de compra correta para o <la> 10910
    Quando o <updateType> vier 3, <service_id> e <product_id>
    Então a assinatura vivo deverá ser realizada com sucesso

    Exemplos:
    |la     |updateType|service_id     |product_id |
    |"10910"|"3"       |"0123456789"   |"754544544"|


Esquema do Cenario: Data Sync Vivo - dados corretos - update type 4

    Dado que o callback do gateway retorne a opção de compra correta para o <la> 10910
    Quando o <updateType> vier 4, <service_id> e <product_id>
    Então a assinatura vivo deverá ser realizada com sucesso

    Exemplos:
    |la     |updateType|service_id     |product_id |
    |"10910"|"4"       |"0123456789"   |"754544544"|


Esquema do Cenario: Data Sync Vivo - cenários negativos - sem la, sem update type e sem msysdn

    Dado que o callback do gateway retorne a opção de compra faltando parametro
    Quando tentar mandar para o subscription com o <updateType>, <msisdn>, <la> 10910, <service_id> e <product_id>
    Então a assinatura vivo deverá ser abortada informando o motivo

    Exemplos:
    |la     |updateType|msisdn               |service_id     |product_id     |
    |""     |"1"       |"5511988390214"      |"0101029700"   |"0055010099"   |
    |"10910"|""        |"5511988390215"      |"0101029700"   |"0055010099"   |
    |"10910"|"0"       |""                   |"0101029700"   |"0055010099"   |
    |"10910"|"0"       |"5511988390215"      |""             |"0055010099"   |
    |"10910"|"0"       |"5511988390215"      |"0101029700"   |""             |
    |"881"  |"0"       |"5511988390216"      |"0101029700"   |"0055010099"   |
    |"10910"|"13434643"|"5511988390217"      |"0101029700"   |"0055010099"   |
    |"10910"|"1"       |"5511988390217364568"|"0101029700"   |"0055010099"   |
    |""     |""        |"5511988"            |"0101029700"   |"0055010099"   |