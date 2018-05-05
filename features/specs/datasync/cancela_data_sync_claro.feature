#language: pt
Funcionalidade: Data Sync Claro - Cancela
  Como um serviço que vai passar informação para o Subscription, preciso que as informações venham corretas
  para que o cancelamento seja realizado.

@data_sync_claro_cancela @datasync
Cenario: Data Sync Claro - Cancela

  Dado que o campaign router passe as informações corretas para cancelamento claro via datasync
  Quando o endpoint estiver certo e os parametros também para realizar o cancelamento da claro via datasync
  Então o cancelamento claro deverá ser realizado com sucesso via datasync


@data_sync_claro_cancela_negativo @datasync
Esquema do Cenario: Data Sync Claro Cancela - Cenários Negativos

    Dado que o campaign router passe as informações erradas para o data sync claro - cancelamento <msisdn>, <la>, <text>, <action>
    Quando as informaçoes baterem no backend para cancelar via datasync <Fsproductid>, <channel>, <transaction_id>, <authCode>, <nomeproduto>, <bcode> e <service_type>
    Então o cancelamento via data sync claro deverá ser abortado com sucesso

    Exemplos:
    |msisdn         |la     |text  |action       |Fsproductid                           |channel    |transaction_id                  |authCode  |nomeproduto |bcode   |service_type|
    |""             |"10910"|"sair"|"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|""     |"sair"|"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|""    |"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sair"|""           |"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sair"|"UNSUBSCRIBE"|""                                    |"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sair"|"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|""         |"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sair"|"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|""                              |"34555425"|"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sair"|"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|""        |"hero_promo"|"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sair"|"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|""          |"FS5566"|"3"         |
    |"5511847584945"|"10910"|"sair"|"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|""      |"3"         |
    |"5511847584945"|"10910"|"sair"|"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|""          |
    |"5511847584945"|"5513" |"sair"|"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"1"         |
    |"5511847584945"|"10910"|"nao" |"UNSUBSCRIBE"|"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"2"         |
    |"5511847584945"|"10910"|"sair"|"UNSUBSCRIBE"|"90"                                  |"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"4"         |
    |"5511847584945"|"10910"|"sair"|"NAOPODE"    |"5f386317-59fb-46b0-9620-a1edd50fa241"|"10910 - H"|"4657384930039485fndh3747598231"|"34555425"|"hero_promo"|"FS5566"|"5"         |