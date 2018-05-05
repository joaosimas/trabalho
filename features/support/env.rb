require "httparty"
require "httparty/request"
require "httparty/response/headers"
require "cpf_faker"
require "faker"
require "yaml"
require "rspec"
require "cucumber"
require 'mysql2' 
require 'pry' 

#Ignore SSL certificate for API requests
HTTParty::Basement.default_options.update(verify: false)

$profile = ENV['PROFILE']

api_configs = YAML.load_file('./features/support/api.yml')
$api = api_configs[$profile]
