require_relative 'core.rb'

module Omniperm
  module Helpers
    private
      def hierarchy
        if [Class, Module].include?(self.class)
          name
        else
          self.class.to_s
        end
      end

      def service_authorized?(context = nil)
        Core.authorize_service(context, returnable: "boolean", hierarchy: hierarchy)
      end

      def service_authorized!(context = nil)
        Core.authorize_service(context, returnable: "raise", hierarchy: hierarchy)
      end
  end
end

