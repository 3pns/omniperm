module Services
  module ModuleService
    def self.compute(user)
      return false unless service_authorized?(user)
      return 42
    end
  end
end
