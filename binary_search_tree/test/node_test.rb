require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/node.rb'

class NodeTest < Minitest::Test

  def setup
      @node = Node.new(10, "movie title")
  end

  def test_node_exists
    assert_instance_of Node, @node
  end

  def test_score_attribute
    assert_equal 10, @node.score
  end

  def test_title_attribute
    assert_equal "movie title", @node.title
  end

  def test_depth_starts_at_zero
    assert_equal 0, @node.depth
  end

  def test_left_returns_nil_to_start
    assert_equal nil, @node.left
  end

  def test_right_returns_nil_to_start
    assert_equal nil, @node.right
  end

  def test_insert_returns_node
    new_node = @node.insert(5, "movie")
    assert_instance_of Node, new_node
  end

  def test_go_right_returns_node
    new_node = @node.go_right(5, "movie")
    assert_instance_of Node, new_node
  end

  def test_go_right_tracks_depth
    new_node = @node.insert(15, "movie")
    new_node2 = @node.insert(25, "another movie")
    assert_equal 1, new_node.depth
    assert_equal 2, new_node2.depth
  end

  def test_go_left_returns_node
    new_node = @node.go_left(5, "movie")
    assert_instance_of Node, new_node
  end

  def test_go_left_tracks_depth
    new_node = @node.insert(7, "movie")
    new_node2 = @node.insert(5, "another movie")
    assert_equal 1, new_node.depth
    assert_equal 2, new_node2.depth
  end

  def test_include
    assert @node.include?(10)
  end

  def test_include_with_many_nodes
    node1 = @node.insert(100, "title")
    node2 = @node.insert(50, "another title")
    node3 = @node.insert(98, "here's another")
    node4 = @node.insert(2, "one more")
    assert @node.include?(100)
    assert @node.include?(50)
    assert @node.include?(98)
    assert @node.include?(2)
    refute @node.include?(4)
    refute @node.include?(101)
  end

  def test_depth_of
    assert_equal 0, @node.depth_of(10)
  end

  def test_depth_of_with_many_nodes
    node1 = @node.insert(100, "title")
    node2 = @node.insert(50, "another title")
    node3 = @node.insert(98, "here's another")
    node4 = @node.insert(2, "one more")
    assert_equal 1, @node.depth_of(100)
    assert_equal 2, @node.depth_of(50)
    assert_equal 3, @node.depth_of(98)
    assert_equal 1, @node.depth_of(2)
  end

end
