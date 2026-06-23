#Example 5 pseudo code

class C1
  def initialize
    @x = 1
    @y = 2
  end

  def get
    @x       # c1's get() returns x
  end

  def m1
    self.get  # calls get() on "self" -- whatever object actually exists at runtime
  end
end

class C2 < C1
  def initialize
    super()      # calls C1's initialize (this is "super initialize()" from the pseudocode)
    @x = 3
    @y = 4
  end

  def get
    @y       # c2 OVERRIDES get() to return y instead of x
  end
end

# Test area
o2 = C2.new
puts "Result of o2.m1: #{o2.m1}"
puts "o2's @x: #{o2.instance_variable_get(:@x)}"
puts "o2's @y: #{o2.instance_variable_get(:@y)}"