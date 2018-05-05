def assinar_claro()

	@msisdns_claro = "5511#{Faker::Number.number(9)}"

	@createbody_claro = {
		"silent" 			=> false,
		"la" 				=> 10910,
		"partner" 			=> "claro",
		"msisdn"			=> @msisdns_claro,
		"fsProductId" 		=> "5f386317-59fb-46b0-9620-a1edd50fa241",
		"channel" 			=> "10910 - H",
		"authCode" 			=> Faker::Number.number(5),
		"transactionIdAuth" => Faker::Number.number(7),
		"debug"             => true,
	}.to_json


 	@create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody_claro)

end



def assinar_oi()

	@msisdns_oi = "5511#{Faker::Number.number(9)}"

	@createbody_oi = {
		"silent" 			=> true,
		"la" 				=> 10910,
		"partner"			=> "oi",
		"msisdn" 			=> @msisdns_oi,
		"fsProductId" 		=> "9a48e98f-8c3d-46d2-903b-cd643f999591",
		"channel" 			=> "10910 - H",
		"debug"             => true,
	}.to_json


 	@create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody_oi)

end



def assinar_tim()

	@msisdns_tim = "5511#{Faker::Number.number(9)}"

	@createbody_tim = {
		"silent" 			=> false,
		"la" 				=> 10910,
		"partner" 			=> "tim",
		"msisdn" 			=> @msisdns_tim,
		"fsProductId" 		=> "2bec115b-9405-472a-bdc9-1cd1f4b61054",
		"channel" 			=> "10910 - H",
		"clientCorrelator" 	=> "",
		"serviceId" 		=> Faker::Number.number(5),
		"subscriptionId" 	=> Faker::Number.number(9),
		"debug"             => true,
	}.to_json


 	@create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody_tim)

end



def assinar_vivo()

	@msisdns_vivo = "5511#{Faker::Number.number(9)}"

	@createbody_vivo = {
		"silent" 			=> true,
		"la" 				=> 10910,
		"partner" 			=> "vivo",
		"msisdn" 			=> @msisdns_vivo,
		"fsProductId" 		=> "bc6a6513-384f-482b-966b-54ee601c97dc",
		"channel" 			=> "10910 - H",
		"debug"             => true,
	}.to_json


 	@create = HTTParty.post($api['assinatura_suspensao_reativacao_cancelamento_operadoras'],:headers => {"Content-Type" => 'application/json'}, :body => @createbody_vivo)

end