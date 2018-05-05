def consulta_cliente_msisdn_cpf()

  consulta_cliente_msisdn_cpf = ''
  client = Mysql2::Client.new(:host => "az-homol-db.fsvas.com", :username => "qa_auto", :password => "B]*PgEa*!_xJ|~!%AE6:Q=az3p5f]PlE", :database => "base_hero")
  #client = Mysql2::Client.new(:host => "fs-dev-db.fsvas.com", :username => "app_hero", :password => "u6ZJWJtAxiI0L740bCJLL2qOJXzx52E6", :database => "base_hero")
  results = client.query("select c.msisdn, c.cpf, c.criado, c.parceiro from base_hero.clientes c where c.cpf is not null and c.cpf <> '' order by c.id DESC limit 1")
  @pry = results
  consulta_cliente_msisdn_cpf = results.to_a
  
  client.close

  return consulta_cliente_msisdn_cpf

end



def chaves_produto_msisdn_cpf()
  produto_msisdn_cpf = ''
  client = Mysql2::Client.new(:host => "az-homol-db.fsvas.com", :username => "qa_auto", :password => "B]*PgEa*!_xJ|~!%AE6:Q=az3p5f]PlE", :database => "base_hero")
  #client = Mysql2::Client.new(:host => "fs-dev-db.fsvas.com", :username => "app_hero", :password => "u6ZJWJtAxiI0L740bCJLL2qOJXzx52E6", :database => "base_hero")
  results = client.query("SELECT ch.parceiro ,ch.chave, c.cpf, ch.data_compra, c.criado, ch.produto, ch.data_cancelamento, ch.cancelador, ch.motivo_cancelamento, ch.id, c.msisdn, ch.nome_produto_comercial, ch.parent_id FROM base_hero.chaves ch INNER JOIN base_hero.clientes c ON ch.cliente=c.id where ch.parent_id is null ORDER BY ch.id DESC LIMIT 1;")
  @pry = results
  produto_msisdn_cpf = results.to_a
  
  client.close

  return produto_msisdn_cpf

end