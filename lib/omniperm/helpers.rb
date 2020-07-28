require_relative 'core.rb'

module Omniperm
  module Helpers
    private
      def service_authorized?(context = nil)
        # TODO instance_values undefiend when not called from an isntance ?
        Core.authorize_service(context, returnable: "boolean")
      end

      def service_authorized!(context = nil)
        # TODO instance_values undefiend when not called from an isntance ?
        Core.authorize_service(context, returnable: "raise")
      end
  end
end

