# frozen_string_literal: true

require_relative 'helper'

describe Omniperm::Core do
  before do
    @user = User.new(:pear)
    @service = Services::ExternalService.new(@user)
    @internal_service = Services::InternalService.new(@user)
    @secret_service = Services::InternalService::SecretService.new(@user)
  end

  it 'should properly detect hierarchy and method_name from a module method' do
    assert_equal 42, Services::ModuleService.compute(@user)
  end

  it 'should properly detect hierarchy and method_name from a class method' do
    assert_equal 42, Services::ClassService.compute(@user)
  end

  it 'should deny if element has default to true' do
    assert_equal false, @internal_service.save_data
  end

  it 'should priorize elements higher in the hierarchy' do    
    assert_equal 42, @secret_service.save_data
  end

  it 'should find element without passing any arg' do
    assert_equal false, @internal_service.authorize_with_no_args
    assert_equal 42, @secret_service.authorize_with_no_args
  end

  it 'should authorize if element in hierarchy is true' do
    assert_equal 42, @service.load_data
  end

  it 'should authorize if method is true' do
    assert_equal 42, @service.buy
  end

  it 'should deny if method exist but has no rule for strategy' do
    assert_equal false, @service.bucket
  end

  it 'should not authorize if no rule in the hierarchy' do
    assert_equal false, @service.n42
  end

end
