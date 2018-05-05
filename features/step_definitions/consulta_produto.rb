# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu acesse o endpoint de consultar produto$/) do

end



Quando(/^existir algum produto$/) do
    
    @response = HTTParty.get($api['consulta_produto'],:headers => {"Content-Type" => 'application/json'})
    puts ($api['consulta_produto'])

end



Então(/^a consulta vai retornar um json com todos os POMs cadastrados no HERO$/) do

  puts @response.body
  case @response.code
    when 200
      puts "Retornou 200, ok"
    when 404
      puts "Retornou 404, não existe"
    when 400
      puts "Retornou 400, problema de negócio"
    when 500...900
      puts "ops #{@response.code}"
  end

  expect(@response.code).to eq 200

end