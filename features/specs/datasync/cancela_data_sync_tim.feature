#language: pt
Funcionalidade: Data Sync Tim - Cancelamento Data Sync
	Como um serviço que vai passar informação para o Subscription, preciso que as informações venham corretas
    para que o cancelamento seja realizado.

@cancela_data_sync_tim @datasync
Cenario: Data Sync Tim
 	Dado que o campaign router mande um cancelamento com as informações corretas para o data sync tim
  	Quando o endpoint estiver certo e os parametros também para cancelar tim via data sync
	Então o cancelamento tim deverá ser realizada com sucesso para a operadora tim via datasync


@cancela_data_sync_tim_negativos @datasync
Esquema do Cenario: Data Sync Tim - Cenários Negativos

    Dado que o campaign router passe as informações erradas para cancelar o data sync tim <txId>, <serviceId>, <msisdn>, <subscriptionId>
    Quando as informaçoes baterem no backend para cancelar data sync tim <origin>, <subscriberMessage>, <channel> e <fs_product_uuid>
    Então o cancelamento do data sync tim deverá ser abortado com sucesso

    Exemplos:
    |txId  |serviceId|msisdn  		    |subscriptionId|origin    |subscriberMessage  |channel    |fs_product_uuid |
    |""    |"3456543"|"5511564738549"   |"5647587965"  |"OPERATOR"|"Joanes Test"	  |"10910 - H"|"23456"         |
    |"6574"|""       |"5511564738549"   |"5647587965"  |"HUB"     |"Joanes Test"	  |"10910 - H"|"23456"         |
    |"6574"|"3456543"|""                |"5647587965"  |"HUB"     |"Joanes Test"	  |"10910 - H"|"23456"         |
    |"6574"|"3456543"|"5511564738549"   |""            |"HUB"     |"Joanes Test"	  |"10910 - H"|"23456"         |
    |"6574"|"3456543"|"5511564738549"   |"567854"      |""        |"Joanes Test"	  |"10910 - H"|"23456"         |
    |"6574"|"3456543"|"5511564738549"   |"567854"      |"OPERATOR"|""	              |"10910 - H"|"23456"         |
    |"6574"|"3456543"|"5511564738549"   |"567854"      |"OPERATOR"|"Simasssss"	      |""         |""              |
    |"6574"|"3456543"|"5511564738549"   |"567854"      |"NAO"     |"Simasssss"	      |"545343245"|"545343245"     |
    |"6574"|"3456543"|"3311564738549"   |""            |"HUB"     |"Joanes Test"      |"10910 - H"|"23456"         |
    |"6574"|"3456543"|"5535311564738549"|""            |"HUB"     |"Joanes Test"      |"10910 - H"|"23456"         |
    |"6574"|"3456543"|"5535311"         |""            |"HUB"     |"Joanes Test"      |"10910 - H"|"23456"         |
   