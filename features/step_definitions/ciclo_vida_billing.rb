# encoding: utf-8 (colocar o cerquilha antes)
# !/usr/bin/env ruby (colocar o cerquilha antes)

Dado(/^que eu acesse o endpoint de cancelamento de fatura$/) do
    
    assinar_claro
    assinar_oi
    assinar_tim
    assinar_vivo

end



Quando(/^eu passar os parametros corretamente e a chave de cancelamento existente subscription_uuid$/) do

    chaves_produto_msisdn_cpf.each do |row|

  @deletebody = {
    "uuid"              => Faker::Number.number(36),
    "event"             => "MAXRETRY",
    "event_date"        => Faker::Time.between(DateTime.now - 1, DateTime.now),
    "amount"            => "0.00",
    "renew_days"        => "0",
    "subscription_uuid" => row['chave'].to_s, #/* External UUID enviado para o Billing na Assinatura do produto, PARA O MODULO Subscription este será o campo chave da tabela chaves */
    "billing_success"   => "0",
    "billing_error"     => "max_attempts",
    "next_bill_date"    => Faker::Time.between(DateTime.now - 1, DateTime.now)
}.to_json
    
    puts @deletebody
    @delete = HTTParty.delete($api['ciclo_vida_billing'],:headers => {"Content-Type" => 'application/json'}, :body => @deletebody)
    puts ($api['ciclo_vida_billing'])

  end

end



Então(/^o cancelamento da fatura vai ser realizado com sucesso$/) do

  puts @delete.body
  case @delete.code
    when 200
      puts "Retornou 200, ok"
    when 404
      puts "Retornou 404, não existe"
    when 400
      puts "Retornou 400, problema de negócio"
    when 500...600
      puts "ops #{@create.code}"
  end

  expect(@delete.code).to eq 200
  response = JSON.parse(@delete.body, object_class: OpenStruct)
  expect(response.success).to eq true

end