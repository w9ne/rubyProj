#Example 3 pseduo code

class C1
  def initialize
    # fields x and y start unset (nil) until explicitly set
  end

  def setx1(v)
    @x = v
  end

  def sety1(v)
    @y = v
  end

  def getx1
    @x
  end

  def gety1
    @y
  end
end

class C2 < C1
  def sety2(v)
    @y = v
  end

  def getx2
    @x
  end

  def gety2
    @y
  end
end

# Test area
o2 = C2.new
o2.setx1(101)
o2.sety1(102)
o2.sety2(999)

puts "o2.getx1: #{o2.getx1}"
puts "o2.gety1: #{o2.gety1}"
puts "o2.getx2: #{o2.getx2}"
puts "o2.gety2: #{o2.gety2}"