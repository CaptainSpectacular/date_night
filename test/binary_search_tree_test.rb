require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'
require './lib/binary_search_tree.rb'

class BinarySearchTreeTest < MiniTest::Test
  
  def setup
    @tree = BinarySearchTree.new
  end

  def test_can_make_new_tree
    assert_instance_of BinarySearchTree, @tree
  end

  def test_tree_has_nil_root_by_default
    assert_equal [nil], @tree.root.data.keys
    assert_equal [nil], @tree.root.data.values
  end

  def test_tree_root_not_empty_after_insert
    @tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal [61], @tree.root.data.keys
    assert_equal ["Bill & Ted's Excellent Adventure"], @tree.root.data.values
  end

  def test_tree_insert_method_works_more_than_once_and_is_accurate
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

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
    @tree.insert(92, "Sharknado 3")

    assert_equal "Value already exists.", @tree.insert(92, "Sharknado 3")
  end

  def test_tree_has_include_method
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")

    assert @tree.include?(61)
    refute @tree.include?(12)
    assert @tree.include?(16)
  end

end