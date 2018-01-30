class Node
  attr_reader :key, :value
  attr_accessor :left, :right, :depth

  def initialize(key, value, depth = 0)
    @key = key
    @value = value
    @depth = 0
    @left = nil
    @right = nil
  end

end
