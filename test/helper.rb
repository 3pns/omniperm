# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"
require_relative '../lib/omniperm'
require_relative 'models/user'
require_relative 'services/class_service'
require_relative 'services/module_service'
require 'minitest/spec'
require 'minitest/autorun'
Dir["models/services/*.rb"].each {|file| require file }
