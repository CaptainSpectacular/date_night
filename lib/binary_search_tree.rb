require './lib/node.rb'
require 'pry'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = Node.new(nil, nil)
  end

  def insert(score, title, position = @root)
    if root.data == {nil => nil}
      @root = Node.new(score, title)

    else
      case score <=> position.data.keys[0]
      when  1 then go_right(score, title, position)
      when -1 then go_left(score, title, position)
      when  0 then stop
      end
    end
  end

  def go_right(score, title, position)
    if position.right == nil
      position.right = Node.new(score, title)

    else
      position = position.right
      insert(score, title, position)

    end
  end

  def go_left(score, title, position)
    if position.left == nil
      position.left = Node.new(score, title)

    else
      position = position.left
      insert(score, title, position)
      
    end
  end

  def stop
    "The value already exists."
  end
end

tree = BinarySearchTree.new
tree.insert(5, "five")
tree.insert(4, "four")
tree.insert(3, "trhee")