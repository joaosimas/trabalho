# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer a suspensao\/reativacao, msisdn, "([^"]*)", quando vier o procuct id "([^"]*)" e "([^"]*)"$/) do |silent, la, fsProductId, partner|

    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar e o msisdn for vivo$/) do |reason, canceler, action|

    assinar_vivo
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)

  @createbody = {
    "silent"          => @silents, #se for true, não será chamado message dispatcher */
    "identifier"      => @msisdns_vivo, #msisdn do cliente a ser suspenso*/
    "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
    "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
    "partner"         => @partners, #obrigatorio */
    "reason"          => @reasons, #obrigatorio caso seja suspensao */
    "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
    "action"          => @actions #S para suspender, A para ativar */
  }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^a suspensao\/reativacao será realizada apenas para o produto solicitado da operadora vivo$/) do

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



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar e o msisdn for claro$/) do |reason, canceler, action|

    assinar_claro
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)

  @createbody = {
    "silent"          => @silents, #se for true, não será chamado message dispatcher */
    "identifier"      => @msisdns_claro, #msisdn do cliente a ser suspenso*/
    "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
    "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
    "partner"         => @partners, #obrigatorio */
    "reason"          => @reasons, #obrigatorio caso seja suspensao */
    "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
    "action"          => @actions #S para suspender, A para ativar */
  }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end


Então(/^a suspensao\/reativacao será realizada apenas para o produto solicitado da operadora claro$/) do

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



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar e o msisdn for oi$/) do |reason, canceler, action|

    assinar_oi
    sleep 1

    @reasons        = (reason)
    @cancelers      = (canceler)
    @actions        = (action)

  @createbody = {
    "silent"        => @silents, #se for true, não será chamado message dispatcher */
    "identifier"    => @msisdns_oi, #msisdn do cliente a ser suspenso*/
    "la"            => @las, #se informado tentará suspender os produtos para o La especificado */
    "fsProductId"   => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
    "partner"       => @partners, #obrigatorio */
    "reason"        => @reasons, #obrigatorio caso seja suspensao */
    "canceler"      => @cancelers, #obrigatorio caso seja suspensao */
    "action"        => @actions #S para suspender, A para ativar */
  }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end


Então(/^a suspensao\/reativacao será realizada apenas para o produto solicitado da operadora oi$/) do

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



Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer a suspensao\/reativacao, msisdn, "([^"]*)", quando vier o procuct id "([^"]*)" ee "([^"]*)"$/) do |silent, la, fsProductId, partner|

    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end

Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar e o msisdn for tim$/) do |reason, canceler, action|
 
    assinar_tim
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)

  chaves_produto_msisdn_cpf.each do |row|

    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => row['chave'].to_s, #msisdn do cliente a ser suspenso*/
      "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "action"          => @actions #S para suspender, A para ativar */
    }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

  end

end


Então(/^a suspensao\/reativacao será realizada apenas para o msisdn solicitado da tim$/) do

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



Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer a suspensao\/reativacao, msisdn, sem passar o "([^"]*)", quando vier o procuct id "([^"]*)" e "([^"]*)"$/) do |silent, la, fsProductId, partner|
    
    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar para claro$/) do |reason, canceler, action|

    assinar_claro
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)


    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => @msisdns_claro,
      "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "action"          => @actions #S para suspender, A para ativar */
    }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^a suspensao\/reativacao será realizada para todos os la desse msisdn claro$/) do

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



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar para vivo$/) do |reason, canceler, action|

    assinar_vivo
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)


    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => @msisdns_vivo,
      "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "action"          => @actions #S para suspender, A para ativar */
    }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^a suspensao\/reativacao será realizada para todos os la desse msisdn vivo$/) do

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



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar para oi$/) do |reason, canceler, action|

    assinar_oi
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)


    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => @msisdns_oi,
      "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "action"          => @actions #S para suspender, A para ativar */
    }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^a suspensao\/reativacao será realizada para todos os la desse msisdn oi$/) do

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



Dado(/^que eu acesse o endpoint passando o "([^"]*)" para fazer a suspensao\/reativacao, msisdn, "([^"]*)", quando não vier "([^"]*)" e "([^"]*)"$/) do |silent, la, fsProductId, partner|
    
    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end




Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar e o msisdn da operação for tim$/) do |reason, canceler, action|
   
    assinar_tim
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)

  chaves_produto_msisdn_cpf.each do |row|

    @createbody = {
      "silent"          => @silents, #se for true, não será chamado message dispatcher */
      "identifier"      => row['chave'].to_s, #msisdn do cliente a ser suspenso*/
      "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
      "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
      "partner"         => @partners, #obrigatorio */
      "reason"          => @reasons, #obrigatorio caso seja suspensao */
      "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
      "action"          => @actions #S para suspender, A para ativar */
    }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

  end

end



Então(/a suspensao\/reativacao será realizada para todos os produtos que o msisdn tim tiver$/) do
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




Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar e o msisdn da operação for vivo$/) do |reason, canceler, action|

    assinar_vivo
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)

  @createbody = {
    "silent"          => @silents, #se for true, não será chamado message dispatcher */
    "identifier"      => @msisdns_vivo, #msisdn do cliente a ser suspenso*/
    "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
    "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
    "partner"         => @partners, #obrigatorio */
    "reason"          => @reasons, #obrigatorio caso seja suspensao */
    "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
    "action"          => @actions #S para suspender, A para ativar */
  }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/a suspensao\/reativacao será realizada para todos os produtos que o msisdn vivo tiver$/) do
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



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar e o msisdn da operação for claro$/) do |reason, canceler, action|
  
    assinar_claro
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)

  @createbody = {
    "silent"          => @silents, #se for true, não será chamado message dispatcher */
    "identifier"      => @msisdns_claro, #msisdn do cliente a ser suspenso*/
    "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
    "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
    "partner"         => @partners, #obrigatorio */
    "reason"          => @reasons, #obrigatorio caso seja suspensao */
    "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
    "action"          => @actions #S para suspender, A para ativar */
  }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/a suspensao\/reativacao será realizada para todos os produtos que o msisdn claro tiver$/) do
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



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar e o msisdn da operação for oi$/) do |reason, canceler, action|

    assinar_oi
    sleep 1

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)

  @createbody = {
    "silent"          => @silents, #se for true, não será chamado message dispatcher */
    "identifier"      => @msisdns_oi, #msisdn do cliente a ser suspenso*/
    "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
    "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
    "partner"         => @partners, #obrigatorio */
    "reason"          => @reasons, #obrigatorio caso seja suspensao */
    "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
    "action"          => @actions #S para suspender, A para ativar */
  }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/a suspensao\/reativacao será realizada para todos os produtos que o msisdn oi tiver$/) do
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



Dado(/^que eu acesse o endpoint passando os parametros errados "([^"]*)" para fazer a suspensao\/reativacao, msisdn, "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |silent, la, fsProductId, partner|
    
    @silents          = (silent)
    @las              = (la)
    @fsproductids     = (fsProductId)
    @partners         = (partner)

end



Quando(/^eu passar o "([^"]*)", "([^"]*)", "([^"]*)" vier S para suspender ou A para reativar e o "([^"]*)"$/) do |reason, canceler, action, msisdn|

    @reasons          = (reason)
    @cancelers        = (canceler)
    @actions          = (action)
    @msisdns          = (msisdn)

  @createbody = {
    "silent"          => @silents, #se for true, não será chamado message dispatcher */
    "identifier"      => @msisdns, #msisdn do cliente a ser suspenso*/
    "la"              => @las, #se informado tentará suspender os produtos para o La especificado */
    "fsProductId"     => @fsproductids, #se não informado irá suspender todos os produtos do msisdn, para TIM será o subscriptionId */
    "partner"         => @partners, #obrigatorio */
    "reason"          => @reasons, #obrigatorio caso seja suspensao */
    "canceler"        => @cancelers, #obrigatorio caso seja suspensao */
    "action"          => @actions #S para suspender, A para ativar */
  }.to_json
    
    puts @createbody
    @create = HTTParty.patch($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody)
    puts ($api['assinatura_suspensao_reativacao_cancelamento_operadoras'])

end



Então(/^a suspensao\/reativacao não vai acontecer para produto nenhum$/) do

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

