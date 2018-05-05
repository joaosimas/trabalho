# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu acesse o endpoint passando o "([^"]*)" true e false para fazer o provisionamento, "([^"]*)", "([^"]*)" tim e msisdn$/) do |silent, la, partner|
    
    @silents              = (silent)
    @las                  = (la)
    @partners             = (partner)
    @msisdns              = "5511#{Faker::Number.number(9)}"

end



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |fsProductId, channel, applicationid, serviceid, subscriptionid|

    @fsProductIds         = (fsProductId)
    @channels             = (channel)
    @applicationids       = (applicationid)
    @serviceids           = (serviceid)
    @subscriptionids      = (subscriptionid)

  @createbody = {
     "silent"             => @silents,  #se for true, não será chamado message dispatcher */
     "la"                 => @las, #La da assinatura */
     "partner"            => @partners, #Pareceiro ao qual será realizada a assinatura */
     "msisdn"             => @msisdns, #msisdn a ser assinado */
     "fsProductId"        => @fsProductIds, #ID do produto FS (produtos_parceiros) */
     "channel"            => @channels, #Canal de venda do produto */
     "applicationId"      => @applicationids, #Application ID utilizado para referencia do produto na TIM */
     "serviceId"          => @serviceids, #Service ID utilizado para referencia do produto na TIM */
     "subscriptionId"     => @subscriptionids, #Hash que representa a transação de assinatura, será utilizado para cancelar o produto quando for solicitado */
     "debug"              => true,
    }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o provisionamento será realizado com sucesso tanto para silent true quanto false$/) do

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



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" e "([^"]*)" invalido$/) do |fsProductId, channel, applicationid, serviceid, subscriptionid, msisdn_invalido|

    @fsProductIds         = (fsProductId)
    @channels             = (channel)
    @applicationids       = (applicationid)
    @serviceids           = (serviceid)
    @subscriptionids      = (subscriptionid)
    @msisdn_invalidos     = (msisdn_invalido)

  @createbody = {
     "silent"             => @silents,  #se for true, não será chamado message dispatcher */
     "la"                 => @las, #La da assinatura */
     "partner"            => @partners, #Pareceiro ao qual será realizada a assinatura */
     "msisdn"             => @msisdn_invalidos, #msisdn a ser assinado */
     "fsProductId"        => @fsProductIds, #ID do produto FS (produtos_parceiros) */
     "channel"            => @channels, #Canal de venda do produto */
     "applicationId"      => @applicationids, #Application ID utilizado para referencia do produto na TIM */
     "serviceId"          => @serviceids, #Service ID utilizado para referencia do produto na TIM */
     "subscriptionId"     => @subscriptionids, #Hash que representa a transação de assinatura, será utilizado para cancelar o produto quando for solicitado */
     "debug"              => true,
    }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Dado(/^que eu acesse o endpoint passando a palavra nada no parametro "([^"]*)", "([^"]*)", "([^"]*)" tim e msisdn$/) do |silent, la, partner|
    
    @silents              = (silent)
    @las                  = (la)
    @partners             = (partner)
    @msisdns              = "5511#{Faker::Number.number(9)}"

end



Dado(/^que eu acesse o endpoint passando a palavra "([^"]*)", "([^"]*)" diferente de 10910, "([^"]*)" tim e msisdn$/) do |silent, la, partner|
    
    @silents              = (silent)
    @las                  = (la)
    @partners             = (partner)
    @msisdns              = "5511#{Faker::Number.number(9)}"

end



Dado(/^que eu acesse o endpoint passando a palavra "([^"]*)", "([^"]*)", "([^"]*)" diferente de tim e msisdn$/) do |silent, la, partner|
    
    @silents              = (silent)
    @las                  = (la)
    @partners             = (partner)
    @msisdns              = "5511#{Faker::Number.number(9)}"

end



Então(/^o provisionamento não vai ser realizado pois o partner não pode ser diferente de tim$/) do

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



Quando(/^eu passar o "([^"]*)" vazio, "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |fsProductId, channel, applicationid, serviceid, subscriptionid|

    @fsProductIds           = (fsProductId)    
    @channels               = (channel)    
    @applicationids         = (applicationid)    
    @serviceids             = (serviceid)    
    @subscriptionids        = (subscriptionid)    

  @createbody = {
     "silent"               => @silents,  #se for true, não será chamado message dispatcher */    
     "la"                   => @las, #La da assinatura */    
     "partner"              => @partners, #Pareceiro ao qual será realizada a assinatura */    
     "msisdn"               => @msisdns, #msisdn a ser assinado */    
     "fsProductId"          => @fsProductIds, #ID do produto FS (produtos_parceiros) */    
     "channel"              => @channels, #Canal de venda do produto */    
     "applicationId"        => @applicationids, #Application ID utilizado para referencia do produto na TIM */    
     "serviceId"            => @serviceids, #Service ID utilizado para referencia do produto na TIM */    
     "subscriptionId"       => @subscriptionids, #Hash que representa a transação de assinatura, será utilizado para cancelar o produto quando for solicitado */    
     "debug"                => true,
    }.to_json
    
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Quando(/^eu passar o "([^"]*)", "([^"]*)" inexistente, "([^"]*)", "([^"]*)", "([^"]*)"$/) do |fsProductId, channel, applicationid, serviceid, subscriptionid|

    @fsProductIds            = (fsProductId)     
    @channels                = (channel)     
    @applicationids          = (applicationid)     
    @serviceids              = (serviceid)     
    @subscriptionids         = (subscriptionid)     

  @createbody = {
     "silent"                => @silents,  #se for true, não será chamado message dispatcher */     
     "la"                    => @las, #La da assinatura */     
     "partner"               => @partners, #Pareceiro ao qual será realizada a assinatura */     
     "msisdn"                => @msisdns, #msisdn a ser assinado */     
     "fsProductId"           => @fsProductIds, #ID do produto FS (produtos_parceiros) */     
     "channel"               => @channels, #Canal de venda do produto */     
     "applicationId"         => @applicationids, #Application ID utilizado para referencia do produto na TIM */     
     "serviceId"             => @serviceids, #Service ID utilizado para referencia do produto na TIM */     
     "subscriptionId"        => @subscriptionids, #Hash que representa a transação de assinatura, será utilizado para cancelar o produto quando for solicitado */     
     "debug"                 => true,
    }.to_json
    
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Dado(/^que eu acesse o endpoint passando o "([^"]*)" true e false para fazer o provisionamento, "([^"]*)", sem o parametro partner tim e msisdn$/) do |silent, la|
    
    @silents                 = (silent)     
    @las                     = (la)     
    @msisdns                 = "5511#{Faker::Number.number(9)}"     

end



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" sem o partner$/) do |fsProductId, channel, applicationid, serviceid, subscriptionid|

    @fsProductIds            = (fsProductId)     
    @channels                = (channel)     
    @applicationids          = (applicationid)     
    @serviceids              = (serviceid)     
    @subscriptionids         = (subscriptionid)     

  @createbody = {
     "silent"                => @silents,  #se for true, não será chamado message dispatcher */     
     "la"                    => @las, #La da assinatura */     
     "msisdn"                => @msisdns, #msisdn a ser assinado */     
     "fsProductId"           => @fsProductIds, #ID do produto FS (produtos_parceiros) */     
     "channel"               => @channels, #Canal de venda do produto */     
     "applicationId"         => @applicationids, #Application ID utilizado para referencia do produto na TIM */     
     "serviceId"             => @serviceids, #Service ID utilizado para referencia do produto na TIM */     
     "subscriptionId"        => @subscriptionids, #Hash que representa a transação de assinatura, será utilizado para cancelar o produto quando for solicitado */     
     "debug"                 => true,
    }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])
    
end



Então(/^o provisionamento não vai ser realizado pois o parametro partner é obrigatório$/) do
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
end