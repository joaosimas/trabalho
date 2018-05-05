# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu acesse o endpoint de consulta de produto por parceiro$/) do


end



Quando(/^eu passar algum "([^"]*)"$/) do |parceiro|

    @parceiro = parceiro

    endpoint            = $api['consulta_produto_operadora']
    mount               = endpoint.gsub("<parceiro>", @parceiro)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Então(/^vai retornar apenas os produtos desse parceiro$/) do

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



Quando(/^eu passar algum "([^"]*)" que ñão exista$/) do |parceiro|

    @parceiro = parceiro

    endpoint            = $api['consulta_produto_operadora']
    mount               = endpoint.gsub("<parceiro>", @parceiro)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Então(/^vai retornar uma mensagem de erro informando que esse parceiro não é permitido$/) do

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

  expect(@response.code).to eq 406

end