# frozen_string_literal: true

require_relative 'helper'

describe Omniperm::Core do
  before do
    @user = User.new(:nanosoft)
  end

  it 'is doing something' do
    puts " doing"
    p @user
  end

end
