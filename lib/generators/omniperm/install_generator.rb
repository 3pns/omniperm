require 'rails/generators'

module Omniperm
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc "Creates Omniperm initializer and copy a template authorizations.yml to your application."

      def copy_initializer
        copy_file "omniperm.rb", "config/initializers/omniperm.rb"
      end

      def copy_authorizations
        copy_file "omniperm.yml", "config/omniperm.yml"
      end
    end
  end
end
