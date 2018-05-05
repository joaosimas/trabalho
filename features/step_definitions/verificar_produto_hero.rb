# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu chame o v1\/main\/subscribe\/msisdn\/{msisdn}$/) do

  @msisdn                 = Faker::Number.number(11)
  @msisdn_inexistente     = Faker::Number.number(20)
  @msisdn_vazio           = ''

end



Quando(/^o cliente tiver qualquer produto hero e for localizado por msisdn$/) do

chaves_produto_msisdn_cpf.each do |row|

    endpoint               = $api['get_verificaCliente_produtoHero_porMsisdn']
    mount                  = endpoint.gsub("<msisdn>", row['msisdn'].to_s)

    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

  end

end



Então(/^a consulta vai retornar 200 listando todos os produtos$/) do

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

  #CASO QUEIRA FAZER UM EXPECTATION POR ID DO PRODUTO
  #expect(@response["data"][0]['productId']).to eq("1249").or eq("130").or eq("131").or eq("571")
  #.or eq("133").or eq("134").or eq("667").or eq("656").or eq("659").or eq("662").or eq("664")

end



Quando(/^o cliente tiver qualquer produto hero mas a consulta for feita por um msisdn que nao exista$/) do

  endpoint                  = $api['get_verificaCliente_produtoHero_porMsisdn']
  mount                     = endpoint.gsub("<msisdn>", @msisdn_inexistente)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Então(/^vai ser retornado 404 - cliente nao encontrado$/) do

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



Quando(/^o cliente tiver qualquer produto hero mas não for passado o número do msisdn$/) do

  endpoint                  = $api['get_verificaCliente_produtoHero_porMsisdn']
  mount                     = endpoint.gsub("<msisdn>", @msisdn_vazio)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Então(/^vai ser retornado 404 - Pagina nao encontrada$/) do

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

end



Dado(/^que eu chame o v1\/main\/subscribe\/cpf\/{cpf}$/) do

  @cpf                        = Faker::Number.number(11)
  @cpf_inexistente            = Faker::Number.number(20)
  @cpf_vazio                  = ''

end



Quando(/^o cliente tiver qualquer produto hero e for localizado por cpf$/) do

chaves_produto_msisdn_cpf.each do |row|

    endpoint                  = $api['get_verificaCliente_produtoHero_porCpf']
    mount                     = endpoint.gsub("<cpf>", row['cpf'].to_s)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

  end

end



Quando(/^o cliente tiver qualquer produto hero mas a consulta for feita por um cpf que nao exista$/) do

  endpoint                     = $api['get_verificaCliente_produtoHero_porCpf']
  mount                        = endpoint.gsub("<cpf>", @cpf_inexistente)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Quando(/^o cliente tiver qualquer produto hero mas não for passado o número do cpf$/) do

  endpoint                      = $api['get_verificaCliente_produtoHero_porCpf']
  mount                         = endpoint.gsub("<cpf>", @cpf_vazio)
    
    @response = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Dado(/^que eu chame o v1\/main\/subscribe\/msisdn\/{msisdn} ou {cpf}$/) do


end



Quando(/^o cliente tiver qualquer produto hero mas a consulta for feita errada sendo passado o método PUT$/) do

chaves_produto_msisdn_cpf.each do |row|

    endpoint                    = $api['get_verificaCliente_produtoHero_porCpf']
    mount                       = endpoint.gsub("<cpf>", row['cpf'].to_s)
    
    @response = HTTParty.put(mount,:headers => {"Content-Type" => 'application/json'})
    puts (mount)

  end
  
end



Então(/^a consulta vai retornar 405 method not allowed$/) do

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


