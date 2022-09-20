class Triangle
  attr_reader :a, :b, :c
  def initialize sideA, sideB, sideC
    @a = sideA
    @b = sideB
    @c = sideC
  end

  def kind
    if valid?
      if a == b && b == c
        :equilateral
      elsif a == b || b == c || a == c
        :isosceles
      else
        :scalene
      end
    else
      nil
    end
  end

  def valid?
    if [a,b,c].all? { |length| length > 0 }
      if a+b>c && b+c>a && c+a>b
        return true
      else
        # begin
          raise TriangleError
        # rescue TriangleError => exception
        #   puts "The sum of the lengths of any two sides of a triangle should always exceed the length of the third side"
        # end
      end
    else
      # begin
        raise TriangleError
      # rescue TriangleError => exception
      #   puts "Each side of a triangle must be larger than 0."
      # end
    end
    return false
  end

  class TriangleError < StandardError
    def message
      "The sum of the lengths of any two sides of a triangle should always exceed the length of the third side\nEach side of a triangle must be larger than 0."
    end
  end
end
