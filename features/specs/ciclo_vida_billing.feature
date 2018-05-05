#language: pt
@cancelamento_billing
Funcionalidade: Cancelando Fatura
	Como uma API, quando eu chamar o endpoint de cancelamento da fatura passando os parametros corretos, o cliente não pode ser faturado.

Cenario: cancelando pagamento 

 	Dado que eu acesse o endpoint de cancelamento de fatura
  	Quando eu passar os parametros corretamente e a chave de cancelamento existente subscription_uuid
	Então o cancelamento da fatura vai ser realizado com sucesso