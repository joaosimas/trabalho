# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que o callback do gateway retorne a opção de compra correta para o "([^"]*)" 10910$/) do |la|
    
    @las                = (la)
    @msisdns            = "5511#{Faker::Number.number(9)}"
    @campaign_uuid      = Faker::Number.number(28)
    @fs_product_id      = "bc6a6513-384f-482b-966b-54ee601c97dc"

end



Quando(/^o "([^"]*)" vier 0, "([^"]*)" e "([^"]*)"$/) do |updateType, service_id, product_id|

    @updateTypes        = (updateType)
    @service_ids        = (service_id)
    @product_ids        = (product_id)

    endpoint = $api['assinaecancela_data_sync_vivo']
    mount = endpoint.gsub("<la>", @las)
    mount = mount.gsub("<updateType>", @updateTypes)
    mount = mount.gsub("<service_id>", @service_ids)
    mount = mount.gsub("<product_id>", @product_ids)
    mount = mount.gsub("<campaign_uuid>", @campaign_uuid)
    mount = mount.gsub("<fs_product_id>", @fs_product_id)
    mount = mount.gsub("<telefone>", @msisdns)
    
    
    @create = HTTParty.get(mount, :headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Quando(/^o "([^"]*)" vier 1, "([^"]*)" e "([^"]*)"$/) do |updateType, service_id, product_id|

    @updateTypes        = (updateType)
    @service_ids        = (service_id)
    @product_ids        = (product_id)

    endpoint = $api['assinaecancela_data_sync_vivo']
    mount = endpoint.gsub("<la>", @las)
    mount = mount.gsub("<service_id>", @service_ids)
    mount = mount.gsub("<product_id>", @product_ids)
    mount = mount.gsub("<updateType>", @updateTypes)
    mount = mount.gsub("<campaign_uuid>", @campaign_uuid)
    mount = mount.gsub("<fs_product_id>", @fs_product_id)
    mount = mount.gsub("<telefone>", @msisdns)
    
    
    @create = HTTParty.get(mount, :headers => {"Content-Type" => 'application/json'})
    puts (mount)

end




Quando(/^o "([^"]*)" vier 2, "([^"]*)" e "([^"]*)"$/) do |updateType, service_id, product_id|

    @updateTypes        = (updateType)
    @service_ids        = (service_id)
    @product_ids        = (product_id)

    endpoint = $api['assinaecancela_data_sync_vivo']
    mount = endpoint.gsub("<la>", @las)
    mount = mount.gsub("<service_id>", @service_ids)
    mount = mount.gsub("<product_id>", @product_ids)
    mount = mount.gsub("<updateType>", @updateTypes)
    mount = mount.gsub("<campaign_uuid>", @campaign_uuid)
    mount = mount.gsub("<fs_product_id>", @fs_product_id)
    mount = mount.gsub("<telefone>", @msisdns)
    
    
    @create = HTTParty.get(mount, :headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Quando(/^o "([^"]*)" vier 3, "([^"]*)" e "([^"]*)"$/) do |updateType, service_id, product_id|
    
    assinar_vivo
    puts "esse msisdn vivo que foi contratado vai ser cancelado"
    puts @msisdns_vivo
    sleep 1

    @updateTypes        = (updateType)
    @service_ids        = (service_id)
    @product_ids        = (product_id)

    endpoint = $api['assinaecancela_data_sync_vivo']
    mount = endpoint.gsub("<la>", @las)
    mount = mount.gsub("<service_id>", @service_ids)
    mount = mount.gsub("<product_id>", @product_ids)
    mount = mount.gsub("<updateType>", @updateTypes)
    mount = mount.gsub("<campaign_uuid>", @campaign_uuid)
    mount = mount.gsub("<fs_product_id>", @fs_product_id)
    mount = mount.gsub("<telefone>", @msisdns_vivo)
    
    
    @create = HTTParty.get(mount, :headers => {"Content-Type" => 'application/json'})
    puts (mount)

end



Quando(/^o "([^"]*)" vier 4, "([^"]*)" e "([^"]*)"$/) do |updateType, service_id, product_id|

    @updateTypes        = (updateType)
    @service_ids        = (service_id)
    @product_ids        = (product_id)

    endpoint = $api['assinaecancela_data_sync_vivo']
    mount = endpoint.gsub("<la>", @las)
    mount = mount.gsub("<service_id>", @service_ids)
    mount = mount.gsub("<product_id>", @product_ids)
    mount = mount.gsub("<updateType>", @updateTypes)
    mount = mount.gsub("<campaign_uuid>", @campaign_uuid)
    mount = mount.gsub("<fs_product_id>", @fs_product_id)
    mount = mount.gsub("<telefone>", @msisdns)
    
    
    @create = HTTParty.get(mount, :headers => {"Content-Type" => 'application/json'})
    puts (mount)

end




Então(/^a assinatura vivo deverá ser realizada com sucesso$/) do

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




Dado(/^que o callback do gateway retorne a opção de compra faltando parametro$/) do
    
    @campaign_uuid      = Faker::Number.number(28)
    @fs_product_id      = "bc6a6513-384f-482b-966b-54ee601c97dc"

end




Quando(/^tentar mandar para o subscription com o "([^"]*)", "([^"]*)", "([^"]*)" 10910, "([^"]*)" e "([^"]*)"$/) do |updateType, la, msisdn, service_id, product_id|

    @updateTypes        = (updateType)
    @las                = (la)
    @msisdns            = (msisdn)
    @service_ids        = (service_id)
    @product_ids        = (product_id)

    endpoint = $api['assinaecancela_data_sync_vivo']
    mount = endpoint.gsub("<la>", @las)
    mount = mount.gsub("<service_id>", @service_ids)
    mount = mount.gsub("<product_id>", @product_ids)
    mount = mount.gsub("<updateType>", @updateTypes)
    mount = mount.gsub("<campaign_uuid>", @campaign_uuid)
    mount = mount.gsub("<fs_product_id>", @fs_product_id)
    mount = mount.gsub("<telefone>", @msisdns)
    
    
    @create = HTTParty.get(mount, :headers => {"Content-Type" => 'application/json'})
    puts (mount)

end




Então(/^a assinatura vivo deverá ser abortada informando o motivo$/) do

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