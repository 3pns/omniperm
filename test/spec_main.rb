# frozen_string_literal: true

require_relative 'helper'

describe Omniperm::Core do
  before do
    @user = User.new(:nanosoft)
    @service = Services::ExternalService.new(@user)
  end

  it 'is doing something' do
    p @service.load_data
    p @service.buy
    p @service.bucket
    p @service.n42
  end

end
