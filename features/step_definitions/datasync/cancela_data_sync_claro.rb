# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que o campaign router passe as informações corretas para cancelamento claro via datasync$/) do
    
   assina_data_sync_claro
   puts "msisdn contratado que vai ser cancelado, "
   puts @data_sync_msisdns_claro
   sleep 1

end



Quando(/^o endpoint estiver certo e os parametros também para realizar o cancelamento da claro via datasync$/) do


  @createbody = {
      "msisdn"                  => @data_sync_msisdns_claro,
      "la"                      => "10910",
      "text"                    => "sair",
      "action"                  => "UNSUBSCRIBE",
      "fs-product-id"           => "5f386317-59fb-46b0-9620-a1edd50fa241", #SELECT * FROM base_hero.produtos_parceiros pp WHERE pp.nome LIKE ('HERO PROMO%')
      "channel"                 => "10910 - H",
      "transaction_id"          => Faker::Number.number(32),
      "auth_code"               => Faker::Number.number(5),
      "nome_produto"            => "hero_promo",
      "bcode"                   => "FS5566",
      "service_type"            => 3
    }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinaecancela_data_sync_claro'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinaecancela_data_sync_claro'])

end




Então(/^o cancelamento claro deverá ser realizado com sucesso via datasync$/) do

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




Dado(/^que o campaign router passe as informações erradas para o data sync claro - cancelamento "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |msisdn, la, text, action|
    
   @msisdns                     = msisdn
   @las                         = la
   @texts                       = text
   @actions                     = action

end



Quando(/^as informaçoes baterem no backend para cancelar via datasync "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |fsProductId, channel, transaction_id, authCode, nome_produto, bcode, service_type|

    @fsProductIds              = fsProductId
    @channels                  = channel
    @transaction_ids           = transaction_id
    @authCodes                 = authCode
    @nome_produtos             = nome_produto
    @bcodes                    = bcode
    @service_types             = service_type


  @createbody = {
      "msisdn"                  => @msisdns,
      "la"                      => @las,
      "text"                    => @texts,
      "action"                  => @actions,
      "fs-product-id"           => @fsProductIds, #SELECT * FROM base_hero.produtos_parceiros pp WHERE pp.nome LIKE ('HERO PROMO%')
      "channel"                 => @channels,
      "transaction_id"          => @transaction_ids,
      "auth_code"               => @authCodes,
      "nome_produto"            => @nome_produtos,
      "bcode"                   => @bcodes,
      "service_type"            => @service_types
    }.to_json
    
    puts @createbody
    @create = HTTParty.post($api['assinaecancela_data_sync_claro'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinaecancela_data_sync_claro'])

end




Então(/^o cancelamento via data sync claro deverá ser abortado com sucesso$/) do

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