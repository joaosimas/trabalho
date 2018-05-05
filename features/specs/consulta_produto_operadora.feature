#language: pt
@consulta_produto_operadora
Funcionalidade: Consultar Produtos da Operadora
	Como uma API, quando eu chamar o endpoint de consulta vai retornar um json com todos os POMs cadastrados no HERO para este parceiro

Esquema do Cenario: Consultar produtos do parceiro

 	Dado que eu acesse o endpoint de consulta de produto por parceiro
  	Quando eu passar algum <parceiro>
	Então vai retornar apenas os produtos desse parceiro

	Exemplos:
    |parceiro|
    |"claro" |
    |"oi"	 |
    |"tim"   |
	|"vivo"	 |


Esquema do Cenario: Consultar produtos do parceiro - Inexistente

 	Dado que eu acesse o endpoint de consulta de produto por parceiro
  	Quando eu passar algum <parceiro> que ñão exista
	Então vai retornar uma mensagem de erro informando que esse parceiro não é permitido

	Exemplos:
	|parceiro|
	|"algar" |