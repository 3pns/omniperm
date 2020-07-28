# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"
require_relative '../lib/omniperm'
require_relative 'models/user'
require_relative 'services/class_service'
require_relative 'services/module_service'
require_relative 'services/external_service'
require 'minitest/spec'
require 'minitest/autorun'
Dir["models/services/*.rb"].each {|file| require file }

# configure Omniperm
Omniperm.configure do |config|
  config.config_file = 'test/test_config.yml'
  config.whitelisted_contexts = ["nanosoft", "pear", "googol"]
  config.determine_strategy = -> (obj, instance_variables){
    enterprise = instance_variables["enterprise"]
    tenant = instance_variables["tenant"]
    return obj if obj.class == String
    return obj.connection_type if [Tenant, Enterprise].include?(obj.class)
    return obj.tenant.enterprise.connection_type if obj.respond_to?("tenant")
    return enterprise.connection_type if enterprise
    return tenant.connection_type if tenant
  }
end
