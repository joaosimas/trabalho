# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu envie uma solicitação de cancelamento para a "([^"]*)"$/) do |operadora|
    
   @operadora                 = operadora

end




Quando(/^a requisição for feita corretamente para a claro passando "([^"]*)" e "([^"]*)"$/) do |action, bcode|

  assinar_claro
  sleep 1

  @action                     = action
  @bcode                      = bcode
  

    @createbody = {
      "msisdn"                => @msisdns_claro,
      "action"                => @action,
      "bcode"                 => @bcode
    }.to_json
    


    endpoint                  = $api['cancela_subscription_datasyncs']
    mount                     = endpoint.gsub("<operadora>", @operadora)
    @create = HTTParty.post(mount,:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts (mount)
    puts @msisdns_claro

end




Então(/^o subscription vai mandar uma solicitação para o Datasync cancelar a operadora claro$/) do

  puts @create.body
  case @create.code
    when 200
      puts "Retornou 200, ok"
    when 404
      puts "Retornou 404, não existe"
    when 400
      puts "Retornou 400, problema de negócio"
    when 500...600
      puts "ops #{@create.code}"
  end

  expect(@create.code).to eq 200

end




Quando(/^a requisição for feita errada para a claro passando "([^"]*)" e "([^"]*)"$/) do |action, bcode|

  assinar_claro
  sleep 1

  @action                     = action
  @bcode                      = bcode
  

    @createbody = {
      "msisdn"                => @msisdns_claro,
      "action"                => @action,
      "bcode"                 => @bcode
    }.to_json
    


    endpoint                  = $api['cancela_subscription_datasyncs']
    mount                     = endpoint.gsub("<operadora>", @operadora)
    @create = HTTParty.post(mount,:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts (mount)
    puts @msisdns_claro

end




Então(/^o subscription não vai mandar uma solicitação para o Datasync cancelar a operadora claro$/) do

  puts @create.body
  case @create.code
    when 200
      puts "Retornou 200, ok"
    when 404
      puts "Retornou 404, não existe"
    when 400
      puts "Retornou 400, problema de negócio"
    when 500...600
      puts "ops #{@create.code}"
  end

  expect(@create.code).to eq 400

end




Quando(/^a requisição for feita corretamente para a vivo passando "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |la, serviceId, productId, tipo_canal, canal|

  assinar_vivo
  sleep 1

  @la                         = la
  @serviceId                  = serviceId
  @productId                  = productId
  @tipo_canal                 = tipo_canal
  @canal                      = canal
  

    @createbody = {
      "msisdn"                => @msisdns_vivo,
      "la"                    => @la,
      "serviceId"             => @serviceId,
      "productId"             => @productId,
      "tipo_canal"            => @tipo_canal,
      "canal"                 => @canal
    }.to_json
    


    endpoint                  = $api['cancela_subscription_datasyncs']
    mount                     = endpoint.gsub("<operadora>", @operadora)
    @create = HTTParty.post(mount,:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts (mount)
    puts @msisdns_vivo

end




Então(/^o subscription vai mandar uma solicitação para o Datasync cancelar a operadora vivo$/) do

  puts @create.body
  case @create.code
    when 200
      puts "Retornou 200, ok"
    when 404
      puts "Retornou 404, não existe"
    when 400
      puts "Retornou 400, problema de negócio"
    when 500...600
      puts "ops #{@create.code}"
  end

  expect(@create.code).to eq 200

end




Quando(/^a requisição for feita errada para a vivo passando "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |la, serviceId, productId, tipo_canal, canal|

  assinar_vivo
  sleep 1

  @la                         = la
  @serviceId                  = serviceId
  @productId                  = productId
  @tipo_canal                 = tipo_canal
  @canal                      = canal
  

    @createbody = {
      "msisdn"                => @msisdns_vivo,
      "la"                    => @la,
      "serviceId"             => @serviceId,
      "productId"             => @productId,
      "tipo_canal"            => @tipo_canal,
      "canal"                 => @canal
    }.to_json
    


    endpoint                  = $api['cancela_subscription_datasyncs']
    mount                     = endpoint.gsub("<operadora>", @operadora)
    @create = HTTParty.post(mount,:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts (mount)
    puts @msisdns_vivo

end




Então(/^o subscription não vai mandar uma solicitação para o Datasync cancelar a operadora vivo$/) do

  puts @create.body
  case @create.code
    when 200
      puts "Retornou 200, ok"
    when 404
      puts "Retornou 404, não existe"
    when 400
      puts "Retornou 400, problema de negócio"
    when 500...600
      puts "ops #{@create.code}"
  end

  expect(@create.code).to eq 400

end




Quando(/^a requisição for feita corretamente para a tim passando "([^"]*)"$/) do |action|

  assinar_tim
  sleep 1

  @action                     = action
  

    @createbody = {
      "msisdn"                => @msisdns_tim,
      "action"                => @action
    }.to_json
    


    endpoint                  = $api['cancela_subscription_datasyncs']
    mount                     = endpoint.gsub("<operadora>", @operadora)
    @create = HTTParty.post(mount,:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts (mount)
    puts @msisdns_tim

end




Então(/^o subscription vai mandar uma solicitação para o Datasync cancelar a operadora tim$/) do

  puts @create.body
  case @create.code
    when 200
      puts "Retornou 200, ok"
    when 404
      puts "Retornou 404, não existe"
    when 400
      puts "Retornou 400, problema de negócio"
    when 500...600
      puts "ops #{@create.code}"
  end

  expect(@create.code).to eq 200

end




Quando(/^a requisição for feita errada para a tim passando "([^"]*)"$/) do |action|

  assinar_tim
  sleep 1

  @action                     = action
  

    @createbody = {
      "msisdn"                => @msisdns_tim,
      "action"                => @action
    }.to_json
    


    endpoint                  = $api['cancela_subscription_datasyncs']
    mount                     = endpoint.gsub("<operadora>", @operadora)
    @create = HTTParty.post(mount,:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts (mount)
    puts @msisdns_tim

end




Então(/^o subscription não vai mandar uma solicitação para o Datasync cancelar a operadora tim$/) do

  puts @create.body
  case @create.code
    when 200
      puts "Retornou 200, ok"
    when 404
      puts "Retornou 404, não existe"
    when 400
      puts "Retornou 400, problema de negócio"
    when 500...600
      puts "ops #{@create.code}"
  end

  expect(@create.code).to eq 400

end