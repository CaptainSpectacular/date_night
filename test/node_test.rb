require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < MiniTest::Test

  def setup
    @node = Node.new(61, "Sixty-One")
    @node.insert(75, "Seventy-Five")
    @node.insert(31, "Thirty-One")
    @node.insert(50, "Fifty")
    @node.insert(42, "Fourty-Two")
  end

  def test_node_exists_and_is_node
    assert_instance_of Node, @node
  end
  
  def test_node_has_parent_and_root_parent_is_nil
    node = Node.new(47, 'Fourty-Seven')

    assert_equal nil, node.parent

    node.insert(46, 'Fourty-Six')

    assert_equal node, node.left.parent
  end

  def test_node_data_is_hash_and_has_data
    assert_instance_of Hash, @node.data
    assert_equal 61, @node.score
    assert_equal "Sixty-One", @node.title
  end

  def test_node_include_method
    assert @node.include?(50)
    refute @node.include?(109)
  end

  def test_depth
    assert_equal 0, @node.depth
    assert_equal 1, @node.left.depth
    assert_equal 3, @node.left.right.left.depth
  end

  def test_find_value_method
    assert_instance_of Node, @node.find_value(31)
    assert_equal 31, @node.find_value(31).score
    assert_equal "Thirty-One", @node.find_value(31).title
    assert_equal "Value does not exist.", @node.find_value(9)
  end

end