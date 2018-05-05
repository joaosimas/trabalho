#language: pt
@cancela_subscription_datasync_planos @datasync
Funcionalidade: Cancelamento do subscription Para o DataSync
	Depois Escrevo

Esquema do Cenario: Cancelar operadoras do Subscription para o Datasync - CLARO
    
	Dado que eu envie uma solicitação de cancelamento para a <operadora>
  	Quando a requisição for feita corretamente para a claro passando <action> e <bcode>
	Então o subscription vai mandar uma solicitação para o Datasync cancelar a operadora claro


	Exemplos:
	|operadora|action		|bcode   |
	|"claro"  |"UNSUBSCRIBE"|"FSC066"|


Esquema do Cenario: Cancelar operadoras do Subscription para o Datasync - CLARO NEGATIVOS
    
	Dado que eu envie uma solicitação de cancelamento para a <operadora>
  	Quando a requisição for feita errada para a claro passando <action> e <bcode>
	Então o subscription não vai mandar uma solicitação para o Datasync cancelar a operadora claro


	Exemplos:
	|operadora|action		|bcode   |
	|"claro"  |"ERRADO"     |"FS5566"|
	|""		  |"UNSUBSCRIBE"|"FS5566"|
	|""		  |""			|"FS5566"|
	|"claro"  |"UNSUBSCRIBE"|""		 |
	|""  	  |""			|""		 |



Esquema do Cenario: Cancelar operadoras do Subscription para o Datasync - VIVO
    
	Dado que eu envie uma solicitação de cancelamento para a <operadora>
  	Quando a requisição for feita corretamente para a vivo passando <la>, <serviceId>, <productId>, <tipo_canal>, <canal>
	Então o subscription vai mandar uma solicitação para o Datasync cancelar a operadora vivo


	Exemplos:
	|operadora |la 	  	 |serviceId   |productId  							 |tipo_canal|canal   |
	|"vivo"	   |"10910"  |"0123456789"|"bc6a6513-384f-482b-966b-54ee601c97dc"|"api"		|"teste" |


Esquema do Cenario: Cancelar operadoras do Subscription para o Datasync - VIVO NEGATIVOS
    
	Dado que eu envie uma solicitação de cancelamento para a <operadora>
  	Quando a requisição for feita errada para a vivo passando <la>, <serviceId>, <productId>, <tipo_canal>, <canal>
	Então o subscription não vai mandar uma solicitação para o Datasync cancelar a operadora vivo


	Exemplos:
	|operadora |la 	  	 |serviceId |productId  |tipo_canal   |canal   |
	|""	  	   |"10910"  |"testess" |"voltando" |"api"		  |"teste" |
	|"vivo"	   |""       |"testess" |"voltando" |"api"		  |"teste" |
	|"vivo"	   |"10910"  |""        |"voltando" |"api"		  |"teste" |
	|"vivo"	   |"10910"  |"testess" |""         |"api"		  |"teste" |
	|"vivo"	   |"10910"  |"testess" |"voltando" |""  		  |"teste" |
	|"vivo"	   |"10910"  |"testess" |"voltando" |"api"		  |""      |
	|"vivo"	   |"881"    |"testess" |"voltando" |"api"		  |"teste" |
	|""	   	   |"" 		 |""		|"" 		|""		  	  |"" 	   |


Esquema do Cenario: Cancelar operadoras do Subscription para o Datasync - TIM
    
	Dado que eu envie uma solicitação de cancelamento para a <operadora>
  	Quando a requisição for feita corretamente para a tim passando <action>
	Então o subscription vai mandar uma solicitação para o Datasync cancelar a operadora tim


	Exemplos:
	|operadora |action		 |
	|"tim"	   |"UNSUBSCRIBE"|


Esquema do Cenario: Cancelar operadoras do Subscription para o Datasync - TIM NEGATIVOS
    
	Dado que eu envie uma solicitação de cancelamento para a <operadora>
  	Quando a requisição for feita errada para a tim passando <action>
	Então o subscription não vai mandar uma solicitação para o Datasync cancelar a operadora tim


	Exemplos:
	|operadora |action		 |
	|"tim"	   |"TESTE"	     |
	|""		   |"UNSUBSCRIBE"|
	|"tim"	   |""			 |
	|""		   |""			 |