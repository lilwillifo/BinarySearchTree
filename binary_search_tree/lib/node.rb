class Node
  attr_reader :key, :value
  attr_accessor :left, :right, :depth

  def initialize(key, value, depth = 0)
    @key = key
    @value = value
    @depth = depth
    @left = nil
    @right = nil
  end

end
