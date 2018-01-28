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
    "Value already exists."
  end

  def include?(number, current = @root)
    if number == current.data.keys[0]
      return true

    elsif number > current.data.keys[0]
      current.right ? include?(number, current.right) : false

    else
      current.left ? include?(number, current.left) : false

    end
  end

  def depth_of(number, current = @root, depth = 0)
    if include?(number)
      if number == current.data.keys[0]
        return depth
      elsif number > current.data.keys[0]
        depth += 1
        current = current.right
        depth_of(number, current, depth)

      else
        depth += 1
        current = current.left
        depth_of(number, current, depth)

      end

    else
      "Value does not exist"
    end
  end

  def max
    current = @root

    while current.right
      current = current.right

    end

    current.data
  end

  def min
    current = @root

    while current.left
      current = current.left

    end

    current.data
  end
end
