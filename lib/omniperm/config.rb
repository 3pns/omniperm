require 'yaml'

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
      @authorizable_name = 'service'
      @config_file = "config/#{@authorizable_name}_authorizations.yml"
      @whitelisted_contexts = []
      begin
        @rules = YAML.load_file(@config_file)
      rescue
        @rules = {}
      end
      @determine_strategy = -> (context){
        return "default"
      }
    end

    def config_file=(config_file)
      @config_file = config_file
      @rules = YAML.load_file(@config_file)
    end

    def determine_strategy=(new_strategy)
      @determine_strategy = new_strategy
      Object.class_eval do
        def __omniperm_determine_strategy(context)
          self.instance_exec(context, &Omniperm.config.determine_strategy)
        end
      end
    end
  end
end

