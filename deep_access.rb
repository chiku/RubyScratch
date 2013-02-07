class AbsorbCall < BasicObject
  def method_missing(*args, &block)
  end

  def respond_to?(method_name)
    true
  end
end

class SingletonChain
  MAX_DEPTH = 5

  include Enumerable

  def initialize(klass)
    @klass = klass
  end

  def each
    current = @klass
    1.upto(MAX_DEPTH) do
      yield current
      current = current.singleton_class
    end
    yield AbsorbCall.new
  end
end

class Class
  def deep_access(method_name)
    SingletonChain.new(self).detect { |c| c.respond_to?(method_name) }.send(method_name)
  end
end
