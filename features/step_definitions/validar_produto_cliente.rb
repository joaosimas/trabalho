# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu acesse o endoint v1\/main\/subscribe\/msisdn\/{msisdn}\/productID\/{produto}$/) do

  @msisdn              = Faker::Number.number(11)
  @produto             = Faker::Number.number(3)

end



Quando(/^a consulta for por msisdn e o cliente já tiver o plano$/) do

  chaves_produto_msisdn_cpf.each do |row|

    endpoint           = $api['get_produto_msisdn']
    mount              = endpoint.gsub("<msisdn>", row['msisdn'].to_s)
    mount              = mount.gsub("<produto>", row['produto'].to_s)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

  end

end



Então(/^ele vai tomar um 200 informando que o msisdn dele possui plano ativo$/) do

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
  expect(response.success).to eq true

end



E(/^quando esse endpoint estiver integrado ao sistema, o cliente vai ser notificado que não pode contratar outro plano Hero pois já possui 1 plano ativo$/) do


end



Quando(/^a consulta for por msisdn e o cliente não tiver nenhum plano hero ativo$/) do

    endpoint            = $api['get_produto_msisdn']
    mount               = endpoint.gsub("<msisdn>", @msisdn)
    mount               = mount.gsub("<produto>", @produto)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Então(/^ele vai tomar um 404 por não ter plano ativo, dessa forma ele esta apto a contratar um plano$/) do

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



Dado(/^que eu acesse o endoint v1\/main\/subscribe\/cpf\/{cpf}\/productID\/{produto}$/) do

  @cpf                   = Faker::Number.number(11)
  @produto               = Faker::Number.number(3)

end



Quando(/^a consulta for por cpf e o cliente já tiver o plano$/) do

  chaves_produto_msisdn_cpf.each do |row|

    endpoint              = $api['get_produto_cpf']
    mount                 = endpoint.gsub("<cpf>", row['cpf'].to_s)
    mount                 = mount.gsub("<produto>", row['produto'].to_s)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

  end

end



Então(/^ele vai tomar um 200 informando que o cpf dele possui plano ativo$/) do

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
  expect(response.success).to eq true

end



Quando(/^a consulta for por cpf e o cliente não tiver nenhum plano hero ativo$/) do

    endpoint               = $api['get_produto_cpf']
    mount                  = endpoint.gsub("<cpf>", @cpf)
    mount                  = mount.gsub("<produto>", @produto)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end