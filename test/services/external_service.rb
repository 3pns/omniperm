module Services
  class ExternalService

    def initialize(user)
      @user = user
    end

    def load_data
      return false unless service_authorized?(@user)
      return 42
    end

    def buy
      return false unless service_authorized?(@user)
      return 42
    end

    def bucket
      return false unless service_authorized?(@user)
      return 42
    end

    def n42
      return false unless service_authorized?(@user)
      return 42
    end
  end
end
