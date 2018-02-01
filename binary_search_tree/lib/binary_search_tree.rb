require './lib/node.rb'
require 'pry'

class BinarySearchTree
  attr_reader :root, :total

  def initialize
    @root = nil
    @total = 0
  end

  def insert(score, title, current_node = @root)
    @total += 1
    if @root.nil?
      @root = Node.new(score, title, 0)
      @root.depth
    else
      new_node = current_node.insert(score, title)
      new_node.depth
    end
  end

  def include?(score, current_node = @root)
    if current_node.nil?
      false
    else
      current_node.include?(score)
    end
  end

  def depth_of(score, current_node = @root)
    if include?(score) == false
      nil
    else
      current_node.depth_of(score)
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
      current_node.min
    end
  end

  def sort(node = @root, sorted_array = [])
    if !node.left.nil?
      sort(node.left, sorted_array)
    end
    sorted_array.push({node.title => node.score})
    if !node.right.nil?
      sort(node.right, sorted_array)
    end
    sorted_array
  end

  def load(filename)
    unique_array = array_of_unique_scores(filename)
    count = 0
    unique_array.each do |hash|
      count += 1
      insert(hash.values.join.to_i, hash.keys.join)
    end
    count
  end

  def translate_file_to_hashes(filename)
    file = File.open(filename, "r")
    file.readlines.map do |line|
      array = line.chomp.split(", ")
      score = array.first.to_i
      title = array[1..-1].join(", ")
      {title => score}
    end
  end

  def array_of_unique_scores(filename)
    hash_array = translate_file_to_hashes(filename)
    hash_array.map do |hash|
      if !include?(hash.values.join.to_i)
        hash
      end
    end.compact
  end

  def health(depth, current_node = @root)
    #score, children, %
    if @root == nil
      []
    else
      current_node.health(depth)
    end

  end


end
