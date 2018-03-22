module Accessors
  def self.included(receiver)
    receiver.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        define_method(name) { instance_variable_get("@#{name}") }
        define_method("#{name}_history") { instance_variable_get("@#{name}_history") }
        define_method("#{name}=") do |value|
          values = (instance_variable_get("@#{name}_history") || [])
          instance_variable_set("@#{name}_history", values << instance_variable_get("@#{name}"))
          instance_variable_set("@#{name}", value)
        end
      end
    end

    def strong_attr_accessor(name, type)
      define_method(name) { instance_variable_get("@#{name}") }
      define_method("#{name}=") do |value|
        raise 'Invalid value type' unless value.is_a?(type)
        instance_variable_set("@#{name}", value)
      end
    end
  end
end
