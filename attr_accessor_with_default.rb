module AttrAccessorWithDefault
  def attr_accessor_with_default(name, default)
    instance_variable_name = "@#{name}"
    setter_name = "#{name}="

    define_method(name) do
      instance_variable_set(instance_variable_name, default) unless instance_variable_defined?(instance_variable_name) 
      instance_variable_get(instance_variable_name)
    end

    define_method(setter_name) do |value|
      instance_variable_set(instance_variable_name, value)
    end
  end
end

class Module
  include AttrAccessorWithDefault
end
