# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer o cancelamento, "([^"]*)", "([^"]*)"e "([^"]*)"$/) do |silent, la, fsProductId, partner|
    
    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end



Quando(/^os parametros da vivo forem passados corretamente "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force|

    assinar_vivo
    sleep 1
    @reasons          = (reason)
    @cancelers        = (canceler)
    @forces           = (force)

  @createbody = {
    "silent"          => @silents, #se for true, não será chamado message dispatcher */
    "identifier"      => @msisdns_vivo, #msisdn do cliente a ser cancelado ou para tim subscriptionId */
    "la"              => @las,  #se informado tentará cancelar os produtos para o La especificado */
    "fsProductId"     => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
    "partner"         => @partners, #obrigatorio */
    "reason"          => @reasons, #obrigatorio caso seja suspensao */
    "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
    "force"           => @forces #opcional , quando true cancela mesmo que seja um bundle */
  }.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o cancelamento será realizado com sucesso pelo msisdn do cliente vivo$/) do

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



Quando(/^os parametros da oi forem passados corretamente "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force|
  
    assinar_oi
    sleep 1

    @reasons           = (reason)
    @cancelers         = (canceler)
    @forces            = (force)

  @createbody = {
    "silent"          => @silents, #se for true, não será chamado message dispatcher */
    "identifier"      => @msisdns_oi, #msisdn do cliente a ser cancelado ou para tim subscriptionId */
    "la"              => @las,  #se informado tentará cancelar os produtos para o La especificado */
    "fsProductId"     => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
    "partner"         => @partners, #obrigatorio */
    "reason"          => @reasons, #obrigatorio caso seja suspensao */
    "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
    "force"           => @forces #opcional , quando true cancela mesmo que seja um bundle */
  }.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o cancelamento será realizado com sucesso pelo msisdn do cliente oi$/) do

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



Quando(/^os parametros da claro forem passados corretamente "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force|

    assinar_claro
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @forces           = (force)

  @createbody = {
    "silent"          => @silents, #se for true, não será chamado message dispatcher */
    "identifier"      => @msisdns_claro, #msisdn do cliente a ser cancelado ou para tim subscriptionId */
    "la"              => @las,  #se informado tentará cancelar os produtos para o La especificado */
    "fsProductId"     => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
    "partner"         => @partners, #obrigatorio */
    "reason"          => @reasons, #obrigatorio caso seja suspensao */
    "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
    "force"           => @forces #opcional , quando true cancela mesmo que seja um bundle */
  }.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o cancelamento será realizado com sucesso pelo msisdn do cliente claro$/) do

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



Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer o cancelamento, sem passar o "([^"]*)", "([^"]*)"e "([^"]*)"$/) do |silent, la, fsProductId, partner|

    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end



Quando(/^os parametros forem passados corretamente para cancelar claro sem passar la "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force|

    assinar_claro
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @forces           = (force)

    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => @msisdns_claro,
      "la"              => @las,  #se informado tentará cancelar os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "force"           => @forces #opcional , quando true cancela mesmo que seja um bundle */
    }.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o cancelamento será realizado com sucesso para qualquer la desse msisdn claro$/) do

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



Quando(/^os parametros forem passados corretamente para cancelar vivo sem passar la "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force|

    assinar_vivo
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @forces           = (force)

    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => @msisdns_vivo,
      "la"              => @las,  #se informado tentará cancelar os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "force"           => @forces #opcional , quando true cancela mesmo que seja um bundle */
    }.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o cancelamento será realizado com sucesso para qualquer la desse msisdn vivo$/) do

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



Quando(/^os parametros forem passados corretamente para cancelar oi sem passar la "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force|

    assinar_oi
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @forces           = (force)

    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => @msisdns_oi,
      "la"              => @las,  #se informado tentará cancelar os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "force"           => @forces #opcional , quando true cancela mesmo que seja um bundle */
    }.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o cancelamento será realizado com sucesso para qualquer la desse msisdn oi$/) do

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



Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer o cancelamento, "([^"]*)", sem passar o "([^"]*)"e "([^"]*)"$/) do |silent, la, fsProductId, partner|

    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end



Quando(/^os parametros forem passados corretamente para cancelar claro sem product_id "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force|

    assinar_claro
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @forces           = (force)

    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => @msisdns_claro,
      "la"              => @las,  #se informado tentará cancelar os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "force"           => @forces #opcional , quando true cancela mesmo que seja um bundle */
    }.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o cancelamento será realizado com sucesso para qualquer fsProductId desse msisdn claro$/) do

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



Quando(/^os parametros forem passados corretamente para cancelar vivo sem product_id "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force|
  
    assinar_vivo
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @forces           = (force)

    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => @msisdns_vivo,
      "la"              => @las,  #se informado tentará cancelar os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "force"           => @forces #opcional , quando true cancela mesmo que seja um bundle */
    }.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o cancelamento será realizado com sucesso para qualquer fsProductId desse msisdn vivo$/) do

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




Quando(/^os parametros forem passados corretamente para cancelar oi sem product_id "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force|

    assinar_oi
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @forces           = (force)

    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => @msisdns_oi,
      "la"              => @las,  #se informado tentará cancelar os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "force"           => @forces #opcional , quando true cancela mesmo que seja um bundle */
    }.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o cancelamento será realizado com sucesso para qualquer fsProductId desse msisdn oi$/) do

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



Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer o cancelamento da tim, "([^"]*)", "([^"]*)"e "([^"]*)"$/) do |silent, la, fsProductId, partner|

    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end




Quando(/^for tim e eu passar os paramentros "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force|

    assinar_tim
    sleep 1

    @reasons        = (reason)
    @cancelers      = (canceler)
    @forces         = (force)

  chaves_produto_msisdn_cpf.each do |row|

    @createbody = {
      "silent"        => @silents, #se for true, não será chamado message dispatcher */
      "identifier"    => row['chave'].to_s, #msisdn do cliente a ser cancelado ou para tim subscriptionId */
      #"identifier"   => @chaves,
      "la"            => @las,  #se informado tentará cancelar os produtos para o La especificado */
      "fsProductId"   => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
      "partner"       => @partners, #obrigatorio */
      "reason"        => @reasons, #obrigatorio caso seja suspensao */
      "canceler"      => @cancelers, #obrigatorio caso seja suspensao */
      "force"         => @forces #opcional , quando true cancela mesmo que seja um bundle */
    }.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

  end

end



Então(/^o cancelamento será realizado com sucesso pelo campo chaves da tabela chaves$/) do

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



Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer o cancelamento da tim sem o la, "([^"]*)", "([^"]*)"e "([^"]*)"$/) do |silent, la, fsProductId, partner|

    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end



Então(/^o cancelamento será realizado com sucesso pelo campo chaves da tabela chaves para todos os las desse msisdn$/) do

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



Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer o cancelamento da tim sem passar o product_id, "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |silent, la, fsProductId, partner|

    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end



Então(/^o cancelamento será realizado com sucesso pelo campo chaves da tabela chaves para todos os products_ids desse msisdn$/) do

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



Quando(/^os parametros estiverem errados "([^"]*)", "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |reason, canceler, force, identifier|

    @reasons         = (reason)
    @cancelers       = (canceler)
    @forces          = (force)
    @identifiers     = (identifier)

  @createbody = {
    "silent"         => @silents, #se for true, não será chamado message dispatcher */
    "identifier"     => @identifiers, #msisdn do cliente a ser cancelado ou para tim subscriptionId */
    "la"             => @las,  #se informado tentará cancelar os produtos para o La especificado */
    "fsProductId"    => @fsproductids, #se não informado irá cancelar todos os produtos do msisdn, para TIM será o subscriptionId*/
    "partner"        => @partners, #obrigatorio */
    "reason"         => @reasons, #obrigatorio caso seja suspensao */
    "canceler"       => @cancelers, #obrigatorio caso seja suspensao */
    "force"          => @forces #opcional , quando true cancela mesmo que seja um bundle */
}.to_json
    
    puts @createbody
    @create = HTTParty.delete($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^o cancelamento não será realizado com sucesso$/) do

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