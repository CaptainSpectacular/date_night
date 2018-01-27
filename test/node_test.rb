require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < MiniTest::Test

  def setup
    @node = Node.new(61, "Bill & Ted's Excellent Adventure")
  end

  def test_node_exists_and_is_node
    assert_instance_of Node, @node
  end

  def test_node_value
    assert_equal ["Bill & Ted's Excellent Adventure"], @node.data.keys
    assert_equal [61], @node.data.values
  end
  
  def test_children_are_empty_by_default
    assert_equal [], @node.children
  end
end