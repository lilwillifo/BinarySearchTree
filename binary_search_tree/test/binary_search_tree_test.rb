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

  def test_insert_defines_root
    root = @tree.insert(50, "The Shining")

    assert_equal root, @tree.root.depth
  end

  def test_total_starts_0
    assert_equal 0, @tree.total
  end

  def test_insert_adds_to_total
    @tree.insert(4, "movie")
    @tree.insert(100, "another movie")

    assert_equal 2, @tree.total
  end

  def test_insert_adds_total_after_many_inserts
    num = @tree.insert(20, "movie")
    num2 = @tree.insert(5, "another movie")
    num3 = @tree.insert(99, "more text")
    num4 = @tree.insert(8, " ")

    assert_equal 4, @tree.total
  end


  def test_set_root_has_depth_zero
    root = @tree.insert(80, "Mean Girls")

    assert_equal 0, @tree.root.depth
  end

  def test_insert_returns_integer
    num = @tree.insert(20, "movie")

    assert_instance_of Fixnum, num
  end

  def test_insert_returns_integer_after_several_inserts
    num = @tree.insert(20, "movie")
    num2 = @tree.insert(5, "another movie")
    num3 = @tree.insert(99, "more text")
    num4 = @tree.insert(8, " ")

    assert_instance_of Fixnum, num4
  end

  def test_insert_returns_depth_right
    num = @tree.insert(20, "movie")
    num1 = @tree.insert(21, "movie")
    num2 = @tree.insert(22, "movie")
    num3 = @tree.insert(19, "movie")

    assert_equal 0, num
    assert_equal 1, num1
    assert_equal 2, num2
    assert_equal 1, num3
  end

  def test_insert_returns_depth_left
    num = @tree.insert(20, "movie")
    num1 = @tree.insert(19, "movie")
    num2 = @tree.insert(18, "movie")
    num3 = @tree.insert(17, "movie")

    assert_equal 0, num
    assert_equal 1, num1
    assert_equal 2, num2
    assert_equal 3, num3
  end

  def test_insert_returns_depth_after_2
    num = @tree.insert(20, "movie")
    num2 = @tree.insert(5, "another movie")

    assert_equal 1, num2
  end

  def test_insert_returns_depth_after_3
    num = @tree.insert(20, "movie")
    num2 = @tree.insert(5, "another movie")
    num3 = @tree.insert(25, "tralala")

    assert_equal 1, num2
  end

  def test_insert_returns_depth_after_3
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
    refute @tree.include?(8)
  end

  def test_include_after_three_insertions
    @tree.insert(30, "Here's a movie")
    @tree.insert(50, "Another movie")
    @tree.insert(100, "Diehard")

    assert @tree.include?(30)
    assert @tree.include?(50)
    assert @tree.include?(100)
    refute @tree.include?(99)
  end

  def test_depth_of_returns_nil_when_no_tree
    num = @tree.depth_of(20)

    assert_equal nil, num
  end

  def test_depth_of_returns_depth
    @tree.insert(30, "Here's a movie")
    @tree.insert(50, "Another movie")

    num = @tree.depth_of(50)
    assert_equal 1, num
  end

  def test_max_returns_hash
    @tree.insert(10, "Twilight")
    @tree.insert(20, "How to lose a guy in 10 days")

    assert_instance_of Hash, @tree.max
  end

  def test_max_returns_empty_hash_if_no_root
    empty_hash = {}

    assert_equal empty_hash, @tree.max
  end

  def test_max_returns_hash_of_max
    @tree.insert(10, "Twilight")
    @tree.insert(20, "How to lose a guy in 10 days")

    hash = {"How to lose a guy in 10 days" => 20}
    assert_equal hash, @tree.max
  end

    def test_min_returns_hash
      @tree.insert(10, "Twilight")
      @tree.insert(20, "How to lose a guy in 10 days")

      assert_instance_of Hash, @tree.min
    end

    def test_min_returns_empty_hash_if_no_root
      empty_hash = {}

      assert_equal empty_hash, @tree.min
    end

    def test_min_returns_hash_of_min
      @tree.insert(10, "Twilight")
      @tree.insert(20, "How to lose a guy in 10 days")
      hash = {"Twilight" => 10}

      assert_equal hash, @tree.min
    end

    def test_sort
      @tree.insert(40, "Harry Potter")
      @tree.insert(10, "Twilight")
      @tree.insert(20, "How to lose a guy in 10 days")
      @tree.insert(75, "moviez")
      hash1 = {"Harry Potter" => 40}
      hash2 = {"Twilight" => 10}
      hash3 = {"How to lose a guy in 10 days" => 20}
      hash4 = {"moviez" => 75}
      array = [hash2, hash3, hash1, hash4]

      assert_instance_of Array, @tree.sort
      assert_equal array, @tree.sort
    end

    def test_translate_file_to_hashes_loads_correctly
      array = @tree.translate_file_to_hashes('./data/movies.txt')

      assert_includes array, {"Crossroads" => 52}
    end

    def test_translate_file_to_hashes
      array = @tree.translate_file_to_hashes('./data/movies.txt')

      assert_instance_of Array, array
      assert_instance_of Hash, array[0]
    end

    def test_array_of_unique
      @tree.insert(40, "The Year Dolly Parton Was My Mum")
      array_of_hash = @tree.translate_file_to_hashes('./data/movies.txt')
      array_unique = @tree.array_of_unique_scores('./data/movies.txt')

      assert_instance_of  Array, array_unique
      refute_includes array_unique, {"The Year Dolly Parton Was My Mum" => 40}
      assert_includes array_unique, {"French Dirty" => 75}
    end

    def test_load
      array_of_hash = @tree.translate_file_to_hashes('./data/movies.txt')
      array_unique = @tree.array_of_unique_scores('./data/movies.txt')

      assert_equal 99, @tree.load('./data/movies.txt')
    end

    def test_load_with_duplicates
      @tree.insert(40, "The Year Dolly Parton Was My Mum")
      @tree.insert(55, "Experimenter")
      @tree.insert(7, "I Love You Phillip Morris")
      array_of_hash = @tree.translate_file_to_hashes('./data/movies.txt')
      array_unique = @tree.array_of_unique_scores('./data/movies.txt')

      assert_equal 96, @tree.load('./data/movies.txt')
    end

    def test_health_returns_array
      assert_instance_of Array, @tree.health(0)
    end


end
