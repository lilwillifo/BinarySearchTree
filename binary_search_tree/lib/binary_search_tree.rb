require './lib/node.rb'

class BinarySearchTree
  attr_reader :root, :current_node

  def initialize
    @root = nil
    @current_node = @root
  end

  def insert(key, value)
    if @root == nil
      set_root(key, value)
      # @root.depth
    elsif
    traverse_the_tree(key, value) #returns depth
    compare.depth + 1
    end
  end

  def set_root(key, value)
    @root = Node.new(key, value, 0)
    @current_node = @root
  end


  def traverse_the_tree(key, value) #doesn't account for duplicates
    if key > @current_node.key
      go_right(key, value)
    else
      go_left(key, value)
    end
  end

  def go_right(key, value)
    if @current_node.right == nil
      new_depth = @current_node.depth + 1
      @current_node.right = Node.new(key, value, new_depth)
    else
      @current_node = @current_node.right
      traverse_the_tree(key, value)
    end
  end

  def go_left(key, value)
    if @current_node.left == nil
      new_depth = @current_node.depth + 1
      @current_node.left = Node.new(key, value, new_depth)
    else
      @current_node = @current_node.right
      traverse_the_tree(key, value)
    end
  end
end
