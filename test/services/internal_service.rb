module Services
  class InternalService

    def initialize(user)
      @user = user
    end

    def authorize_with_no_args
      return false unless service_authorized?
      return 42
    end

    def save_data
      return false unless service_authorized?(@user)
      return 42
    end

    class SecretService
      def initialize(user)
        @user = user
      end

      def authorize_with_no_args
        return false unless service_authorized?
        return 42
      end

      def save_data
        return false unless service_authorized?(@user)
        return 42
      end
    end
  end
end
