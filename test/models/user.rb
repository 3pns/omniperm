class User
  def initialize(adaptor_type)  
    @adaptor_type = adaptor_type.to_s
  end

  def load_data
    authorize_service
    return 42
  end

  def buy
    authorize_service
    return 42
  end

  def bucket
    authorize_service
    return 42
  end

  def n42
    authorize_service
    return 42
  end
end
