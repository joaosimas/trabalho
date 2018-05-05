# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu acesse o endpoint passando o "([^"]*)" false para fazer o provisionamento, "([^"]*)", "([^"]*)" e msisdn$/) do |silent, la, partner|
    
    @silents            = (silent)
    @las                = (la)
    @partners           = (partner)
    @msisdns            = "5511#{Faker::Number.number(9)}"

end



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |fsProductId, channel, authCode, transactionIdAuth|

    @fsProductIds       = (fsProductId)
    @channels           = (channel)
    @authCodes          = (authCode)
    @transactionIdAuths = (transactionIdAuth)

  @createbody = {
    "silent"            => @silents, #se for true, não será chamado message dispatcher */    
    "la"                => @las, #La da assinatura */    
    "partner"           => @partners, #Pareceiro ao qual será realizada a assinatura */    
    "msisdn"            => @msisdns, #msisdn a ser assinado */    
    "fsProductId"       => @fsProductIds, #ID do produto FS (produtos_parceiros) */    
    "channel"           => @channels, #Canal de venda do produto */    
    "authCode"          => @authCodes, #Auth Code de venda com a Claro */    
    "transactionIdAuth" => @transactionIdAuths, #Código de transação com a Claro similar ao subscriptionID da Tim */    
    "debug"             => true,
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o provisionamento será realizado com sucesso$/) do

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

  expect(@create.code).to eq 201
  response = JSON.parse(@create.body, object_class: OpenStruct)
  expect(response.success).to eq true

end



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" e "([^"]*)" e fora da regra o "([^"]*)"$/) do |fsProductId, channel, authCode, transactionIdAuth, msisdn_invalido|

    @fsProductIds         = (fsProductId)
    @channels             = (channel)
    @authCodes            = (authCode)
    @transactionIdAuths   = (transactionIdAuth)
    @msisdn_invalidos     = (msisdn_invalido)

  @createbody = {
    "silent"              => @silents, #se for true, não será chamado message dispatcher */
    "la"                  => @las, #La da assinatura */
    "partner"             => @partners, #Pareceiro ao qual será realizada a assinatura */
    "msisdn"              => @msisdn_invalidos, #msisdn a ser assinado */
    "fsProductId"         => @fsProductIds, #ID do produto FS (produtos_parceiros) */
    "channel"             => @channels, #Canal de venda do produto */
    "authCode"            => @authCodes, #Auth Code de venda com a Claro */
    "transactionIdAuth"   => @transactionIdAuths, #Código de transação com a Claro similar ao subscriptionID da Tim */
    "debug"               => true,
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o provisionamento não será realizado pois o msisdn tem que ser igual 13 caracteres$/) do

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

  expect(@create.code).to eq 406
  response = JSON.parse(@create.body, object_class: OpenStruct)
  expect(response.success).to eq false

end



Dado(/^que eu acesse o endpoint passando a palavra nada no parametro "([^"]*)", "([^"]*)", "([^"]*)" e msisdn$/) do |silent, la, partner|
    
    @silents        = (silent)
    @las            = (la)
    @partners       = (partner)
    @msisdns        = "5511#{Faker::Number.number(9)}"

end



Então(/^o provisionamento não vai ser realizado pois o silent só permite true\/false$/) do

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

  expect(@create.code).to eq 406
  response = JSON.parse(@create.body, object_class: OpenStruct)
  expect(response.success).to eq false

end



Dado(/^que eu acesse o endpoint passando a palavra "([^"]*)", "([^"]*)" diferente de 10910, "([^"]*)" e msisdn$/) do |silent, la, partner|

    @silents        = (silent)
    @las            = (la)
    @partners       = (partner)
    @msisdns        = "5511#{Faker::Number.number(9)}"

end



Então(/^o provisionamento não vai ser realizado pois único la que pode provisionar para a promo é 10910$/) do

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

  expect(@create.code).to eq 406
  response = JSON.parse(@create.body, object_class: OpenStruct)
  expect(response.success).to eq false

end



Dado(/^que eu acesse o endpoint passando a palavra "([^"]*)", "([^"]*)", "([^"]*)" diferente de claro e msisdn$/) do |silent, la, partner|

    @silents        = (silent)
    @las            = (la)
    @partners       = (partner)
    @msisdns        = "5511#{Faker::Number.number(9)}"

end



Então(/^o provisionamento não vai ser realizado pois o partner não pode ser diferente de claro$/) do

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

  expect(@create.code).to eq 406
  response = JSON.parse(@create.body, object_class: OpenStruct)
  expect(response.success).to eq false

end



Quando(/^eu passar o "([^"]*)" vazio, "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |fsProductId, channel, authCode, transactionIdAuth|

    @fsProductIds       = (fsProductId)
    @channels           = (channel)
    @authCodes          = (authCode)
    @transactionIdAuths = (transactionIdAuth)

  @createbody = {
    "silent"            => @silents, #se for true, não será chamado message dispatcher */
    "la"                => @las, #La da assinatura */
    "partner"           => @partners, #Pareceiro ao qual será realizada a assinatura */
    "msisdn"            => @msisdns, #msisdn a ser assinado */
    "fsProductId"       => @fsProductIds, #ID do produto FS (produtos_parceiros) */
    "channel"           => @channels, #Canal de venda do produto */
    "authCode"          => @authCodes, #Auth Code de venda com a Claro */
    "transactionIdAuth" => @transactionIdAuths, #Código de transação com a Claro similar ao subscriptionID da Tim */
    "debug"             => true,
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o provisionamento não vai ser realizado pois productid precisa existir$/) do

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

  expect(@create.code).to eq 406
  response = JSON.parse(@create.body, object_class: OpenStruct)
  expect(response.success).to eq false

end



Quando(/^eu passar o "([^"]*)", "([^"]*)" que não existe, "([^"]*)" e "([^"]*)"$/) do |fsProductId, channel, authCode, transactionIdAuth|

    @fsProductIds       = (fsProductId)
    @channels           = (channel)
    @authCodes          = (authCode)
    @transactionIdAuths = (transactionIdAuth)

  @createbody = {
    "silent"            => @silents, #se for true, não será chamado message dispatcher */
    "la"                => @las, #La da assinatura */
    "partner"           => @partners, #Pareceiro ao qual será realizada a assinatura */
    "msisdn"            => @msisdns, #msisdn a ser assinado */
    "fsProductId"       => @fsProductIds, #ID do produto FS (produtos_parceiros) */
    "channel"           => @channels, #Canal de venda do produto */
    "authCode"          => @authCodes, #Auth Code de venda com a Claro */
    "transactionIdAuth" => @transactionIdAuths, #Código de transação com a Claro similar ao subscriptionID da Tim */
    "debug"             => true,
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o provisionamento vai ser realizado pois channel não é validado$/) do

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

  expect(@create.code).to eq 201
  response = JSON.parse(@create.body, object_class: OpenStruct)
  expect(response.success).to eq true

end



Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer o provisionamento, "([^"]*)", "([^"]*)" claro e sem o parametro msisdn$/) do |silent, la, partner|
    
    @silents            = (silent)
    @las                = (la)
    @partners           = (partner)
    @msisdns            = "5511#{Faker::Number.number(9)}"

end



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" e "([^"]*)" com a ausencia do msisdn$/) do |fsProductId, channel, authCode, transactionIdAuth|

    @fsProductIds       = (fsProductId)
    @channels           = (channel)
    @authCodes          = (authCode)
    @transactionIdAuths = (transactionIdAuth)

  @createbody = {
    "silent"            => @silents, #se for true, não será chamado message dispatcher */
    "la"                => @las, #La da assinatura */
    "partner"           => @partners, #Pareceiro ao qual será realizada a assinatura */
    "fsProductId"       => @fsProductIds, #ID do produto FS (produtos_parceiros) */
    "channel"           => @channels, #Canal de venda do produto */
    "authCode"          => @authCodes, #Auth Code de venda com a Claro */
    "transactionIdAuth" => @transactionIdAuths, #Código de transação com a Claro similar ao subscriptionID da Tim */
    "debug"             => true,
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o provisionamento não vai ser realizado pois msisdn é obrigatório$/) do

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

  expect(@create.code).to eq 406
  response = JSON.parse(@create.body, object_class: OpenStruct)
  expect(response.success).to eq false
  
end