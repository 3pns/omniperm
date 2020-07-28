class User
  attr_reader :adaptor_type
  
  def initialize(adaptor_type)  
    @adaptor_type = adaptor_type.to_s
  end
end
