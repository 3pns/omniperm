# frozen_string_literal: true

require_relative 'helper'

describe Omniperm::Core do
  before do
    @user = User.new(:pear)
    @user_googol = User.new(:googol)
    @service_class_decorated_allowed = Services::ExternalServiceClassDecorated.new(@user)
    @service_class_decorated_nanosoft_allowed = Services::ExternalServiceClassDecorated.new(@user_googol)
  end

  it 'should perform authorization' do
    skip("todo: fix method name not properly detected using inheritance")
    assert_equal 42, @service_class_decorated_allowed.load_data
  end

  it 'should perform authorization' do
    skip("todo: fix method name not properly detected using inheritance")
    assert_equal 42, @service_class_decorated_allowed.buy
  end

  it 'should perform authorization' do
    assert_equal false, @service_class_decorated_allowed.bucket
  end

  it 'should perform authorization' do
    assert_equal false, @service_class_decorated_allowed.n42
  end

  it 'should perform authorization' do
    assert_equal 42, @service_class_decorated_nanosoft_allowed.load_data
  end

  it 'should perform authorization' do
    assert_equal 42, @service_class_decorated_nanosoft_allowed.buy
  end

  it 'should perform authorization' do
    assert_equal 42, @service_class_decorated_nanosoft_allowed.bucket
  end

  it 'should perform authorization' do
    assert_equal 42, @service_class_decorated_nanosoft_allowed.n42
  end
end
