require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'
require './lib/binary_search_tree.rb'

class BinarySearchTreeTest < MiniTest::Test
  
  def setup
    @tree = BinarySearchTree.new
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

  end

  def test_can_make_new_tree
    assert_instance_of BinarySearchTree, @tree
  end

  def test_tree_has_nil_root_by_default
    tree = BinarySearchTree.new

    assert_equal [nil], tree.root.data.keys
    assert_equal [nil], tree.root.data.values
  end

  def test_tree_root_not_empty_after_insert
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal [61], tree.root.data.keys
    assert_equal ["Bill & Ted's Excellent Adventure"], tree.root.data.values
  end

  def test_tree_insert_method_works_more_than_once_and_is_accurate

    assert_equal ["Hannibal Buress: Animal Furnace"], @tree.root
                                                           .left
                                                           .right
                                                           .data
                                                           .values
    assert_equal ["Sharknado 3"], @tree.root
                                       .right
                                       .data
                                       .values
  end

  def test_tree_cannot_have_duplicate_values
    assert_equal "Value already exists.", @tree.insert(92, "Sharknado 3")
  end

  def test_tree_has_include_method
    assert @tree.include?(61)
    refute @tree.include?(12)
    assert @tree.include?(16)
  end

  def test_tree_depth_of_method
    assert_equal 0, @tree.depth_of(61)
    assert_equal 1, @tree.depth_of(16)
    assert_equal 1, @tree.depth_of(92)
    assert_equal 2, @tree.depth_of(50)
  end

  def test_tree_min_and_max
    assert_equal 16, @tree.min.keys[0]
    assert_equal ["Johnny English"], @tree.min.values
    assert_equal 92, @tree.max.keys[0]
    assert_equal ["Sharknado 3"], @tree.max.values
  end

  def tree_sort_method
    assert_equal [{"Johnny English"=>16},
                  {"Hannibal Buress: Animal Furnace"=>50},
                  {"Bill & Ted's Excellent Adventure"=>61},
                  {"Sharknado 3"=>92}], @tree.sort
  end

  def test_load_method
    assert_equal 99, @tree.load('./movies.txt')
  end
