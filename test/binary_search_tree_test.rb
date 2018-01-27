require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'
require './lib/binary_search_tree.rb'

class BinarySearchTreeTest < MiniTest::Test

  def test_can_make_new_tree
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end

  def test_tree_has_nil_root_by_default
    tree = BinarySearchTree.new

    assert_equal nil, tree.root
  end

end