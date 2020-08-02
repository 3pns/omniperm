module Omniperm
  module CallbackDecorators

    module MethodsDecorator

      def __before_method
      end

      def __after_method
      end

      def decorate_methods_with_before_and_after
        target_methods = singleton_methods(false) + instance_methods(false)
        target_methods.reject{|value| [:inject_before_to_methods, :__before_method, :__after_method].include?(value) }.each { |m|
          # Rename original method
          target = nil
          target = self if instance_methods(false).include?(m.to_sym)
          target = self.singleton_class if singleton_methods(false).include?(m.to_sym)
          if target
            target.send(:alias_method, "__#{m}_original", m)
            target.define_method m do |*args, **kwargs|
              before_method = Proc.new { 
                if respond_to?("__before_method")
                  return_value = __before_method
                else
                  return_value = target.__before_method
                end
                
                return return_value unless return_value.nil? 
              };
              before_method.call

              if kwargs.empty?
                return self.send "__#{m}_original", *args 
              else
                return self.send "__#{m}_original", *args, **kwargs
              end
              # after_method = Proc.new { 
              #   return_value = __after_method
              #   return return_value unless return_value.nil? 
              # };
              # after_method.call
            end
          end
        }
      end
    end

    class ClassDecorator
      extend CallbackDecorators::MethodsDecorator

      def self.inherited(subclass)
        TracePoint.trace(:end) do |t|
          if subclass == t.self
            subclass.decorate_methods_with_before_and_after
            t.disable
          end
        end
        super
      end
    end

    module MixinDecorator
      def self.included base
        base.extend CallbackDecorators::MethodsDecorator
        TracePoint.trace(:end) do |t|
          if base == t.self
            base.decorate_methods_with_before_and_after
            t.disable
          end
        end
      end
    end
  end

  # is working
  class AuthorizationRequired < CallbackDecorators::ClassDecorator

    def self.__before_method
      # Warning: method name will be dected as __before_method
      unless service_authorized?
        return false # stop execution
      end
      return # allow execution to continue
    end

    def __before_method
      # Warning: method name will be dected as __before_method
      unless service_authorized?
        return false # stop execution
      end
      return # allow execution to continue
    end

  end

  # is broken / dont work anymore
  module Authorizable
    include CallbackDecorators::MixinDecorator

    def __before_method
      unless service_authorized?
        return false # stop execution
      end
      return
    end

    def __after_method
    end

  end
end
