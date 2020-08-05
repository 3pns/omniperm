module Services
  class ExternalServiceClassDecorated < Omniperm::AuthorizationRequired

    def initialize(user)
      @user = user
    end

    def load_data
      return 42
    end

    def buy
      return 42
    end

    def bucket
      return 42
    end

    def n42
      return 42
    end

    def self.my_class_method
      return 42
    end
  end
end
