# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"
require_relative '../lib/omniperm'
require_relative 'models/user'
require_relative 'services/class_service'
require_relative 'services/module_service'
require_relative 'services/external_service'
require_relative 'services/internal_service'
require 'minitest/spec'
require 'minitest/autorun'
Dir["models/services/*.rb"].each {|file| require file }

# configure Omniperm
Omniperm.configure do |config|
  config.config_file = 'test/test_config.yml'
  config.whitelisted_contexts = ["nanosoft", "pear", "googol"]
  config.determine_strategy = -> (obj){
      return obj if obj.class == String
      return @user.adaptor_type if @user
      return obj.adaptor_type if obj.class == User
      return "default"
  }
end
