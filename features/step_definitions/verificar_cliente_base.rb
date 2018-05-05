# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu chame o \/v1\/customer\/msisdn\/{msisdn}$/) do

  @msisdn               = Faker::Number.number(11)
  @msisdn_string        = "TesteMsisdn"

end



Quando(/^a consulta for por msisdn e o mesmo existir na base$/) do

consulta_cliente_msisdn_cpf.each do |row|

    endpoint            = $api['get_cliente_msisdn']
    mount               = endpoint.gsub("<msisdn>", row['msisdn'].to_s)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

  end

end



Então(/^a consulta vai retornar 200 - com sucesso$/) do

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
  response = JSON.parse(@response.body, object_class: OpenStruct)
  expect(response.message).to eq "Cliente encontrado"

end



Quando(/^a consulta for por msisdn e o mesmo não existir na base$/) do

  endpoint            = $api['get_cliente_msisdn']
  mount               = endpoint.gsub("<msisdn>", @msisdn)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Então(/^a consulta vai retornar 404 - not found$/) do

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

  expect(@response.code).to eq 404
  response = JSON.parse(@response.body, object_class: OpenStruct)
  expect(response.success).to eq false

end



Quando(/^a consulta for por msisdn e o mesmo for uma string$/) do

  endpoint            = $api['get_cliente_msisdn']
  mount               = endpoint.gsub("<msisdn>", @msisdn_string)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Então(/^a consulta vai retornar 400 - só aceito número para o parametro msisdn$/) do

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

  expect(@response.code).to eq 404
  response = JSON.parse(@response.body, object_class: OpenStruct)
  expect(response.success).to eq false

end



Dado(/^que eu chame o \/v1\/customer\/cpf\/{cpf}$/) do

  @cpf                = Faker::Number.number(11)
  @cpf_string         = "TesteCpf"

end



Quando(/^a consulta for por cpf e o mesmo existir na base$/) do

consulta_cliente_msisdn_cpf.each do |row|

    endpoint          = $api['get_cliente_cpf']
    mount             = endpoint.gsub("<cpf>", row['cpf'].to_s)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

  end  

end



Quando(/^a consulta for por cpf e o mesmo não existir na base$/) do

  endpoint            = $api['get_cliente_cpf']
  mount               = endpoint.gsub("<cpf>", @cpf)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Quando(/^a consulta for por cpf e o mesmo for uma string$/) do

  endpoint             = $api['get_cliente_cpf']
  mount                = endpoint.gsub("<cpf>", @cpf_string)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Então(/^a consulta vai retornar 400 - só aceito número para o parametro cpf$/) do

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

  expect(@response.code).to eq 404
  response = JSON.parse(@response.body, object_class: OpenStruct)
  expect(response.success).to eq false

end



Quando(/^a consulta for por msisdn e eu passar o método delete$/) do

  endpoint            = $api['get_cliente_msisdn']
  mount               = endpoint.gsub("<msisdn>", @msisdn)
    
    @response = HTTParty.delete(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Então(/^a consulta vai retornar 405 - method not allowed$/) do

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

  expect(@response.code).to eq 405

end