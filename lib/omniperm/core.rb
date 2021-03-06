module Omniperm
  module Core
    def self.authorize(returnable, authorization)
      return authorization if returnable.to_s == "boolean"
      raise Exception.new "Omniperm: Unauthorized" if returnable.to_s == "raise" and authorization == false
    end

    def self.authorize_service(context, returnable: "boolean", hierarchy: "", strategy: "default")
      method_name = caller_locations(2,1)[0].label
      whitelisted_strategies = Omniperm.config.whitelisted_strategies
      rules = Omniperm.config.rules

      return self.authorize(returnable, false) unless whitelisted_strategies.include?(strategy)
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
