require 'pry'

class Node
  attr_reader :score, :title
  attr_accessor :left, :right, :depth

  def initialize(score, title, depth = 0)
    @score = score
    @title = title
    @depth = depth
    @left = nil
    @right = nil
  end

  def insert(score, title)
    if score > @score
      go_right(score, title)
    elsif score < @score
      go_left(score, title)
    end
  end

  def go_right(score, title)
    if @right.nil?
      @right = Node.new(score, title, @depth + 1)
    else
      @right.insert(score, title)
    end
  end

  def go_left(score, title)
    if @left.nil?
      @left = Node.new(score, title, @depth + 1)
    else
      @left.insert(score, title)
    end
  end

  def include?(score) #refactor
    if score > @score
      if @right != nil
        @right.include?(score)
      else
        false
      end
    elsif score < @score
      if @left != nil
        @left.include?(score)
      else
        false
      end
    elsif score == @score
        true
    end
  end

  def depth_of(score)
    if score > @score
        @right.depth_of(score)
    elsif score < @score
        @left.depth_of(score)
    elsif score == @score
        @depth
    end
  end

  def min
    if @left != nil
    min(@left)
    else
      {@title => @score}
    end
  end



end
