#language: pt
@consulta_produto
Funcionalidade: Consulta Produto
	Como uma API, quando eu chamar o endpoint para consultar produto vai retornar um json com todos os POMs cadastrados no HERO

Cenario: consulta produtos

 	Dado que eu acesse o endpoint de consultar produto
  	Quando existir algum produto
	Então a consulta vai retornar um json com todos os POMs cadastrados no HERO