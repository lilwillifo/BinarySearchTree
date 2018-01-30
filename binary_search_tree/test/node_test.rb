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

  def test_key_attribute
    assert_equal 10, @node.key
  end

  def test_value_attribute
    assert_equal "movie title", @node.value
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


end
