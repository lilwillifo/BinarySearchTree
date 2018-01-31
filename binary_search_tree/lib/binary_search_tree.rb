require './lib/node.rb'
require 'pry'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(score, title, current_node = @root)
    if @root.nil?
      @root = Node.new(score, title, 0)
      @root.depth
    else
      new_node = current_node.insert(score, title, @root)
      new_node.depth
    end
  end

  def include?(score, current_node = @root)
    if current_node.nil?
      false
    else
      current_node.include?(score, current_node)
    end
  end

  def depth_of(score, current_node = @root)
    if include?(score) == false
      nil
    else
      current_node.depth_of(score, current_node)
    end
  end

  def max(current_node = @root)
    if @root.nil?
      {}
    elsif current_node.right != nil
      max(current_node.right)
    else
      {current_node.title => current_node.score}
    end
  end

  def min(current_node = @root)
    if @root.nil?
      {}
    else
      current_node.min(current_node)
    end
  end

  def sort(current_node = @root)
    if current_node == nil
      []
    else
      current_node.sort(current_node.left)
    end
  end


end
