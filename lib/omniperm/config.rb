module Omniperm
  # Configures global settings for Omniperm
  #   Omniperm.configure do |config|
  #     config.config_file = 'config/service_authorizations.yml'
  #   end
  class << self
    def configure
      yield config
    end

    def config
      @_config ||= Config.new
    end
  end

  class Config
    attr_accessor :config_file, :whitelisted_contexts, :rules, :determine_strategy 
    attr_reader :rules

    def initialize
      @config_file = 'config/service_authorizations.yml'
      @whitelisted_contexts = []
      @rules = nil
      @rules = YAML.load_file(@config_file)
      @determine_strategy = -> (context){
        return "default"
      }
    end
  end
end

