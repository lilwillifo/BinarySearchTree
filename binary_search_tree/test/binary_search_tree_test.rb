require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/binary_search_tree.rb'

class BinarySearchTreeTest < Minitest::Test

  def setup
      @tree = BinarySearchTree.new
  end

  def test_tree_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_root_starts_nil
    assert_equal nil, @tree.root
  end

  def test_current_node_starts_as_nil
    assert_equal nil, @tree.current_node
  end

  def test_set_root_creates_a_node_and_defines_root
    root = @tree.set_root(50, "The Shining")
    assert_instance_of Node, root
    assert_equal root, @tree.root
  end

  def test_set_root_changes_current_node
    root = @tree.set_root(80, "Mean Girls")
    assert_instance_of Node, @tree.current_node
    assert_equal @tree.current_node, @tree.root
  end

  def test_set_root_has_depth_zero
    root = @tree.set_root(80, "Mean Girls")
    assert_equal 0, @tree.root.depth
  end

  def test_traverse_the_the_tree_returns_node
    root = @tree.set_root(80, "Mean Girls")
    assert_instance_of Node, @tree.traverse_the_tree(40, "Star Wars")
  end

  def test_go_right_returns_node
    root = @tree.set_root(80, "Mean Girls")
    assert_instance_of Node, @tree.traverse_the_tree(40, "Star Wars")
  end

  def test_go_left_returns_node
    root = @tree.set_root(80, "Mean Girls")
    assert_instance_of Node, @tree.go_left(40, "Star Wars")
  end



end
