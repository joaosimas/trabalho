def assina_data_sync_claro()
  
  @data_sync_msisdns_claro     = "5511#{Faker::Number.number(9)}"
  @transaction_id              = Faker::Number.number(32)
  @auth_code                   = Faker::Number.number(5)

  @createbody_claro = {
      "msisdn"                  => @data_sync_msisdns_claro,
      "la"                      => "10910",
      "text"                    => "sim",
      "action"                  => "SUBSCRIBE",
      "fs-product-id"           => "5f386317-59fb-46b0-9620-a1edd50fa241", #SELECT * FROM base_hero.produtos_parceiros pp WHERE pp.nome LIKE ('HERO PROMO%')
      "channel"                 => "10910 - H",
      "transaction_id"          => @transaction_id,
      "auth_code"               => @auth_code,
      "nome_produto"            => "hero_promo",
      "bcode"                   => "FSC066",
      "service_type"            => 3
    }.to_json


  @create = HTTParty.post($api['assinaecancela_data_sync_claro'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody_claro)

end




def assina_data_sync_tim()

  @data_sync_msisdns_tim     = "5511#{Faker::Number.number(9)}"

  @createbody = {
    "SubscriptionNotificationRequest" => {
      "txId"                => Faker::Number.number(4),
      "serviceId"           => Faker::Number.number(7),
      "msisdn"              => @data_sync_msisdns_tim,
      "subscriptionId"      => Faker::Number.number(10),
      "origin"              => "10910",
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


  @create = HTTParty.post($api['assina_data_sync_tim'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody_claro)

end