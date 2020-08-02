module Omniperm
  require_relative 'omniperm/config.rb'
  require_relative 'omniperm/helpers.rb'
  require_relative 'omniperm/decorators.rb'
end

class Object
  include Omniperm::Helpers
end
