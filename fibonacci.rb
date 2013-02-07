class Fibonacci
  def initialize
    @now = 0
    @next = 1
    @count = 0
  end

  def next
    @now, @next = @next, @now + @next
    yield @now
    { :item_number => (@count += 1) }
  end
end
