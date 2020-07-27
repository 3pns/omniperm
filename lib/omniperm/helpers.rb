require_relative 'core.rb'

module Omniperm
  module Helpers
    private
      def service_authorized?(context = nil)
        Core.authorize_service(context, returnable: "boolean", instance_values: instance_values, hierarchy: name)
      end

      def service_authorized!(context = nil)
        Core.authorize_service(context, returnable: "raise", instance_values: instance_values)
      end
  end
end

