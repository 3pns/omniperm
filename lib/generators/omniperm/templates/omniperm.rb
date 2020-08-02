# Configure Omniperm to tailor fit your application
Omniperm.configure do |config|
  config.config_file = 'config/omniperm.yml'

  # Strategies not allowed will be unauthorized
  # Example of common types of strategies :
  # Use roles : admin/staff/user/superuser
  # Third party services : nanosoft/pears/amazonia
  config.whitelisted_strategies = ["nanosoft", "pears", "amazonia"]

  # determine_strategy shall return the strategy of a given object
  config.determine_strategy = -> (obj, instance_variables){
    return obj if obj.class == String
    return @role unless @role.nil?
    return obj.role if obj.respond_to?("role")
    return obj.owner.role if obj.respond_to?("item")
  }
end
