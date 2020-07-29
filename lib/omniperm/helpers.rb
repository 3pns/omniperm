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
        strategy = __omniperm_determine_strategy(context)
        Core.authorize_service(context, returnable: "boolean", hierarchy: hierarchy, strategy: strategy)
      end

      def service_authorized!(context = nil)
        strategy = __omniperm_determine_strategy(context)
        Core.authorize_service(context, returnable: "raise", hierarchy: hierarchy, strategy: strategy)
      end
  end
end
