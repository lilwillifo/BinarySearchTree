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

  def test_insert_returns_integer
    num = @tree.insert(20, "movie")
    assert_instance_of Fixnum, num
  end

  def test_insert_returns_integer_after_several_inserts
    num = @tree.insert(20, "movie")
    num2 = @tree.insert(5, "another movie")
    num3 = @tree.insert(99, "more text")
    num4 = @tree.insert(8, "")
    assert_instance_of Fixnum, num4
  end

  def test_insert_returns_root_node_depth_right
    num = @tree.insert(20, "movie")
    num1 = @tree.insert(21, "movie")
    num2 = @tree.insert(22, "movie")
    num3 = @tree.insert(23, "movie")
    assert_equal 0, num
    assert_equal 1, num1
    assert_equal 2, num2
    assert_equal 3, num3
  end

  def test_insert_returns_root_node_depth_left
    num = @tree.insert(20, "movie")
    num1 = @tree.insert(19, "movie")
    num2 = @tree.insert(18, "movie")
    num3 = @tree.insert(17, "movie")
    assert_equal 0, num
    assert_equal 1, num1
    assert_equal 2, num2
    assert_equal 3, num3
  end

  def test_insert_returns_root_node_depth_after_2
    num = @tree.insert(20, "movie")
    num2 = @tree.insert(5, "another movie")
    assert_equal 1, num2
  end

  def test_insert_returns_root_node_depth_after_3
    num = @tree.insert(20, "movie")
    num2 = @tree.insert(5, "another movie")
    num3 = @tree.insert(25, "tralala")
    assert_equal 1, num2
  end

  def test_insert_returns_root_node_depth_after_3
    num = @tree.insert(20, "movie")
    num2 = @tree.insert(5, "another movie")
    num3 = @tree.insert(10, "tralala")
    assert_equal 1, num2
  end

  def test_include_false_at_start
    refute @tree.include?(10)
  end

  def test_include_after_one_insertion
    num = @tree.insert(30, "Here's a movie")
    assert @tree.include?(30)
  end

  def test_include_after_two_insertions
    @tree.insert(30, "Here's a movie")
    @tree.insert(50, "Another movie")
    assert @tree.include?(30)
    assert @tree.include?(50)
  end



end
