# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que o campaign router passe as informações corretar para o data sync tim$/) do
    
  @msisdn = "5511#{Faker::Number.number(9)}"

end



Quando(/^o endpoint estiver certo e os parametros também para o data sync tim$/) do


  @createbody = {
    "SubscriptionNotificationRequest" => {
      "txId"                => Faker::Number.number(4),
      "serviceId"           => Faker::Number.number(7),
      "msisdn"              => @msisdn,
      "subscriptionId"      => Faker::Number.number(10),
      "origin"              => "OPERATOR",
      "subscriberMessage"   => Faker::GameOfThrones.character,
      "channel"             => "10910 - H",
      "operatorTxId"        => Faker::Number.number(8),
      "serviceType"         => Faker::Number.number(6),
      "expiryDate"          => Faker::Time.between(DateTime.now - 1, DateTime.now),
      "shortCode"           => Faker::Number.number(12),
      "planType"            => Faker::Number.number(4),
      "token"               => Faker::Number.number(7),
      "dateValidate"        => Time.now.strftime("%Y-%m-%d"),
      "productId"           => "2bec115b-9405-472a-bdc9-1cd1f4b61054",
      "planId"              => "HERO-PROMO",
      "args"                => Faker::Number.number(7),
      "campaign_uuid"       => Faker::Number.number(3),
      "fs_product_uuid"     => Faker::Number.number(20)
    }   
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assina_data_sync_tim'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assina_data_sync_tim'])

end




Então(/^a assinatura tim deverá ser realizada com sucesso para a operadora tim via data sync$/) do

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




Dado(/^que o campaign router passe as informações erradas para o data sync tim "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |txId, serviceId, msisdn, subscriptionId|
    
   @txId                    = txId
   @serviceId               = serviceId
   @msisdn                  = msisdn
   @subscriptionId          = subscriptionId

end





Quando(/^as informaçoes baterem no backend "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |origin, subscriberMessage, channel, operatorTxId, serviceType, expiryDate, shortCode, planType, token, dateValidate, productId, planId, args, campaign_uuid, fs_product_uuid|

  @origin                     = origin
  @subscriberMessage          = subscriberMessage
  @channel                    = channel
  @operatorTxId               = operatorTxId
  @serviceType                = serviceType
  @expiryDate                 = expiryDate
  @shortCode                  = shortCode
  @planType                   = planType 
  @token                      = token
  @dateValidate               = dateValidate
  @productId                  = productId
  @planId                     = planId
  @args                       = args
  @campaign_uuid              = campaign_uuid
  @fs_product_uuid            = fs_product_uuid



  @createbody = {
    "SubscriptionNotificationRequest" => {
      "txId"                => @txId,
      "serviceId"           => @serviceId,
      "msisdn"              => @msisdn,
      "subscriptionId"      => @subscriptionId ,
      "origin"              => @origin,
      "subscriberMessage"   => @subscriberMessage,
      "channel"             => @channel,
      "operatorTxId"        => @operatorTxId,
      "serviceType"         => @serviceType,
      "expiryDate"          => @expiryDate,
      "shortCode"           => @shortCode,
      "planType"            => @planType,
      "token"               => @token,
      "dateValidate"        => @dateValidate,
      "productId"           => @productId,
      "planId"              => @planId,
      "args"                => @args,
      "campaign_uuid"       => @campaign_uuid,
      "fs_product_uuid"     => @fs_product_uuid
    }   
  }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assina_data_sync_tim'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assina_data_sync_tim'])

end





Então(/^a assinatura tim deverá ser abortada com sucesso via datasync$/) do

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