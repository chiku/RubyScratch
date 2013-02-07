class Class
  MAX_SINGLETON_DEPTH = 100

  def deep_access(method_name)
    current_reference = self
    current_depth = 0

    while current_depth < MAX_SINGLETON_DEPTH
      if current_reference.respond_to?(method_name)
        return current_reference.send(method_name)
      else
        current_depth += 1
        current_reference = current_reference.singleton_class
      end
    end
  end
end
