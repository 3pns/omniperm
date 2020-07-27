module Omniperm
  class Core
    def self.authorize(returnable, authorization)
      return authorization if returnable.to_s == "boolean"
      raise Exception.new "Omniperm: Unauthorized" if returnable.to_s == "raise" and authorization == false
    end

    def self.authorize_service(context, returnable: "boolean", instance_values: nil, hierarchy: name)

      if [Class, Module].include?(self.class)
        # do class method assignments
        hierarchy = name
        method_name = caller_locations(2,1)[0].label
      else
        # do instance method assignments
        hierarchy = self.class.to_s
        method_name = caller_locations(2,1)[0].label
      end
      context_connection_type = determine_connection_type(context)
      whitelisted_contexts = ServiceAuthorization.instance.whitelisted_contexts
      rules = ServiceAuthorization.instance.rules
      tmp = caller_locations

      return self.authorize(returnable, false) unless whitelisted_contexts.include?(strategy)
      stack = [] + hierarchy.split("::") + [method_name] + [""]
      while stack.slice!(-1) != nil do
        rule = rules
        stack.each do |key|
          next if key.nil?
          rule = rule[key] unless rule.nil?
          return self.authorize(returnable, rule) if [true, false].include?(rule)
        end
        next if rule.nil?
        return  self.authorize(returnable, rule[strategy]) if rule.is_a? Hash and rule.keys.include?(strategy)
        return self.authorize(returnable, rule["default"]) if rule.is_a? Hash and rule.keys.include?("default")
        return self.authorize(returnable, rule) if [true, false].include?(rule)
      end
      return self.authorize(returnable, false)
    end
  end
end
