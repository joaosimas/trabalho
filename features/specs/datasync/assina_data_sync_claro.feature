#language: pt
Funcionalidade: Data Sync Claro - Assina
	Como um serviço que vai passar informação para o Subscription, preciso que as informações venham corretas
    para que a assinatura seja realizada.

@data_sync_claro_assina @datasync
Cenario: Data Sync Claro - Assina

 	Dado que o campaign router passe as informações corretar para o data sync claro
  	Quando o endpoint estiver certo e os parametros também para a claro
	Então a assinatura claro deverá ser realizada com sucesso para a operadora claro

@data_sync_claro_assina_negativo @datasync
Esquema do Cenario: Data Sync Claro Assina - Cenários Negativos

    Dado que o campaign router passe as informações erradas para o data sync claro <msisdn>, <la>, <text>, <action>
    Quando as informaçoes baterem no backend <Fsproductid>, <channel>, <transaction_id>, <authCode>, <nomeproduto>, <bcode> e <service_type>
    Então a assinatura claro deverá ser abortada com sucesso

    Exemplos:
    |msisdn         |la     |text  |action     |Fsproductid                           |channel    |transaction_id                  |authCode  |nomeproduto |bcode   |service_type|
    |""             |"10910"|"sim" |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|""     |"sim" |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|""    |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sim" |""         |"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sim" |"SUBSCRIBE"|""                                    |"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sim" |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|""         |"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sim" |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|""                              |"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sim" |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|""        |"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sim" |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|""          |"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sim" |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|""      |"3"         |
    |"5511847584945"|"10910"|"sim" |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|""          |
    |"5511847584945"|"5513" |"sim" |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"1"         |
    |"5511847584945"|"10910"|"nao" |"SUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"2"         |
    |"5511847584945"|"10910"|"sim" |"SUBSCRIBE"|"90"                                  |"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"4"         |
    |"5511847584945"|"10910"|"sim" |"NAOPODE"  |"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"5"         |