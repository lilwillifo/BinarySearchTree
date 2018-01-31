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

  def insert(score, title, current_node)
    if score > current_node.score
      go_right(score, title, current_node)
    elsif score < current_node.score
      go_left(score, title, current_node)
    end
  end

  def go_right(score, title, current_node)
    if current_node.right.nil?
      current_node.right = Node.new(score, title, current_node.depth + 1)
    else
      insert(score, title, current_node.right)
    end
  end

  def go_left(score, title, current_node)
    if current_node.left.nil?
      current_node.left = Node.new(score, title, current_node.depth + 1)
    else
      insert(score, title, current_node.left)
    end
  end

  def include?(score, current_node)
    if current_node.nil?
        false
    elsif score > current_node.score
        include?(score, current_node.right)
    elsif score < current_node.score
        include?(score, current_node.left)
    elsif score == current_node.score
        true
    end
  end

  def depth_of(score, current_node)
    if score > current_node.score
        depth_of(score, current_node.right)
    elsif score < current_node.score
        depth_of(score, current_node.left)
    elsif score == current_node.score
        current_node.depth
    end
  end

  def min(current_node)
    if current_node.left != nil
    min(current_node.left)
    else
      {current_node.title => current_node.score}
    end
  end

  # def sort(current_node)
  #   sorted_array = []
  #   if current_node.left != nil
  #   sort(current_node.left)
  #   else
  #     sorted_array << {current_node.title => current_node.score}
  #   end
  # end

end
