# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que o campaign router mande um cancelamento com as informações corretas para o data sync tim$/) do
    
  assina_data_sync_tim
  puts "msisdn contratado que vai ser cancelado, "
  puts @data_sync_msisdns_tim
  sleep 1

end



Quando(/^o endpoint estiver certo e os parametros também para cancelar tim via data sync$/) do


  @createbody = {
    "UnsubscriptionNotificationRequest"   => {
      "txId"                              => Faker::Number.number(5),
      "subscriptionId"                    => Faker::Number.number(10),
      "origin"                            => "OPERATOR",
      "serviceId"                         => Faker::Number.number(12),
      "msisdn"                            => @data_sync_msisdns_tim,
      "subscriberMessage"                 => "teste",
      "channel"                           => "agora",
      "fs_product_uuid"                   => Faker::Number.number(3)
    }
}.to_json
    
    puts @createbody
    @create = HTTParty.post($api['cancela_data_sync_tim'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['cancela_data_sync_tim'])

end




Então(/^o cancelamento tim deverá ser realizada com sucesso para a operadora tim via datasync$/) do

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




Dado(/^que o campaign router passe as informações erradas para cancelar o data sync tim "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |txId, serviceId, msisdn, subscriptionId|
    
   @txId                    = txId
   @serviceId               = serviceId
   @msisdn                  = msisdn
   @subscriptionId          = subscriptionId

end





Quando(/^as informaçoes baterem no backend para cancelar data sync tim "([^"]*)", "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |origin, subscriberMessage, channel, fs_product_uuid|

  @origin                     = origin
  @subscriberMessage          = subscriberMessage
  @channel                    = channel
  @fs_product_uuid            = fs_product_uuid



  @createbody = {
    "UnsubscriptionNotificationRequest"   => {
      "txId"                              => @txId,
      "subscriptionId"                    => @subscriptionId,
      "origin"                            => @origin,
      "serviceId"                         => @serviceId,
      "msisdn"                            => @msisdn,
      "subscriberMessage"                 => @subscriberMessage,
      "channel"                           => @channel,
      "fs_product_uuid"                   => @fs_product_uuid
    }
}.to_json
    
    
    puts @createbody
    @create = HTTParty.post($api['cancela_data_sync_tim'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['cancela_data_sync_tim'])

end





Então(/^o cancelamento do data sync tim deverá ser abortado com sucesso$/) do

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