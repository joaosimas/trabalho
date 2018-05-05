# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer o provisionamento, "([^"]*)", "([^"]*)" oi e msisdn$/) do |silent, la, partner|
    
    @silents              = (silent)
    @las                  = (la)
    @partners             = (partner)
    @msisdns              = "5511#{Faker::Number.number(9)}"

end



Quando(/^eu passar o "([^"]*)" e "([^"]*)"$/) do |fsProductId, channel|

    @fsProductIds         = (fsProductId)
    @channels             = (channel)

  @createbody = {
    "silent"              => @silents, #se for true, não será chamado message dispatcher */
    "la"                  => @las, #La da assinatura */
    "partner"             => @partners, #Pareceiro ao qual será realizada a assinatura */
    "msisdn"              => @msisdns, #msisdn a ser assinado */
    "fsProductId"         => @fsProductIds, #ID do produto FS (produtos_parceiros) */
    "channel"             => @channels, #Canal de venda do produto */
    "debug"               => true,
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Dado(/^"que eu acesse o endpoint passando o "([^"]*)" para fazer o provisionamento, "([^"]*)", "([^"]*)" oi e msisdn$/) do |silent, la, partner|
  
    @silents              = (silent)
    @las                  = (la)
    @partners             = (partner)  

end



Quando(/^eu passar o "([^"]*)", "([^"]*)" e "([^"]*)" invalido$/) do |fsProductId, channel, msisdn_invalido|

    @fsProductIds         = (fsProductId)
    @channels             = (channel)
    @msisdn_invalido      = (msisdn_invalido)

  @createbody = {
    "silent"              => @silents, #se for true, não será chamado message dispatcher */
    "la"                  => @las, #La da assinatura */
    "partner"             => @partners, #Pareceiro ao qual será realizada a assinatura */
    "msisdn"              => @msisdn_invalido, #msisdn a ser assinado */
    "fsProductId"         => @fsProductIds, #ID do produto FS (produtos_parceiros) */
    "channel"             => @channels, #Canal de venda do produto */
    "debug"               => true,
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Dado(/^que eu acesse o endpoint passando a palavra "([^"]*)", "([^"]*)", "([^"]*)" diferente de oi e msisdn$/) do |silent, la, partner|
    
    @silents              = (silent)
    @las                  = (la)
    @partners             = (partner)
    @msisdns              = "5511#{Faker::Number.number(9)}"

end



Então(/^o provisionamento não vai ser realizado pois o partner não pode ser diferente de oi$/) do

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



Quando(/^eu passar o "([^"]*)" vazio e "([^"]*)"$/) do |fsProductId, channel|

    @fsProductIds         = (fsProductId)
    @channels             = (channel)

  @createbody = {
    "silent"              => @silents, #se for true, não será chamado message dispatcher */
    "la"                  => @las, #La da assinatura */
    "partner"             => @partners, #Pareceiro ao qual será realizada a assinatura */
    "msisdn"              => @msisdns, #msisdn a ser assinado */
    "fsProductId"         => @fsProductIds, #ID do produto FS (produtos_parceiros) */
    "channel"             => @channels, #Canal de venda do produto */
    "debug"               => true,
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Quando(/^eu passar o "([^"]*)" e "([^"]*)" que não existe$/) do |fsProductId, channel|

    @fsProductIds         = (fsProductId)
    @channels             = (channel)

  @createbody = {
    "silent"              => @silents, #se for true, não será chamado message dispatcher */
    "la"                  => @las, #La da assinatura */
    "partner"             => @partners, #Pareceiro ao qual será realizada a assinatura */
    "msisdn"              => @msisdns, #msisdn a ser assinado */
    "fsProductId"         => @fsProductIds, #ID do produto FS (produtos_parceiros) */
    "channel"             => @channels, #Canal de venda do produto */
    "debug"               => true,
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer o provisionamento, sem o la, "([^"]*)" oi e msisdn$/) do |silent, partner|
    
    @silents              = (silent)
    @partners             = (partner)
    @msisdns              = "5511#{Faker::Number.number(9)}"

end



Quando(/^eu passar o <fsProductId> e <channel> mas não existir o parametro la$/) do |fsProductId, channel|

    @fsProductIds         = (fsProductId)
    @channels             = (channel)

  @createbody = {
    "silent"              => @silents, #se for true, não será chamado message dispatcher */
    "partner"             => @partners, #Pareceiro ao qual será realizada a assinatura */
    "msisdn"              => @msisdns, #msisdn a ser assinado */
    "fsProductId"         => @fsProductIds, #ID do produto FS (produtos_parceiros) */
    "channel"             => @channels, #Canal de venda do produto */
    "debug"               => true,
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o provisionamento não vai ser realizado pois la é obrigatório$/) do

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