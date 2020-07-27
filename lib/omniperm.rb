module Omniperm
  require_relative 'omniperm/config.rb'
  require_relative 'omniperm/helpers.rb'
end

class Object
  include Omniperm::Helpers
end
