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
    
    @tree_two = BinarySearchTree.new
    @tree_two.load('./movies.txt')

    @tree_three = BinarySearchTree.new
    @tree_three.insert(98, "Animals United")
    @tree_three.insert(58, "Armageddon")
    @tree_three.insert(36, "Bill & Ted's Bogus Journey")
    @tree_three.insert(93, "Bill & Ted's Excellent Adventure")
    @tree_three.insert(86, "Charlie's Angels")
    @tree_three.insert(38, "Charlie's Country")
    @tree_three.insert(69, "Collateral Damage")
  end

  def test_tree_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_tree_root_exists
    assert_instance_of Node, @tree.root
  end

  def test_insert_method
    tree = BinarySearchTree.new

    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado 3")
    assert_equal 2, tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_include_method
    assert @tree_two.include?(33)
    refute @tree_two.include?(101)
  end

  def test_sort_method
    expected = [{"Johnny English"=>16},{"Hannibal Buress: Animal Furnace"=>50},
    {"Bill & Ted's Excellent Adventure"=>61},{"Sharknado 3"=>92}]

    assert_equal expected, @tree.sort.map{ |i| {i.title => i.score} }
  end

  def test_size_method
    assert_equal 4, @tree.size
    assert_equal 99, @tree_two.size
  end

  def test_depth_of_method 
    assert_equal 0, @tree.depth_of(61)
    assert_equal 8, @tree_two.depth_of(4)
  end

  def test_min_method
    assert_equal({"Johnny English"=>16}, {@tree.min.title => @tree.min.score})
    assert_equal 0, @tree_two.min.score
  end

  def test_max_method
    assert_equal({"Sharknado 3"=>92}, {@tree.max.title => @tree.max.score})
    assert_equal 100, @tree_two.max.score
  end

  def test_load_method
    tree = BinarySearchTree.new
    assert_equal 99, tree.load('./movies.txt')
  end

  def test_health_method
    assert_equal [[71, 99, 100]],            @tree_two.health(0)
    assert_equal [[98, 7, 100]],             @tree_three.health(0)
    assert_equal [[58, 6, 85]],              @tree_three.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], @tree_three.health(2)
  end
end