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

  
  def sort(current = @root, result = [])
    return result if current == nil

    sort(current.left, result)

    result << current.data

    sort(current.right, result)
  end


  def load(filename)
    scores = []
    titles = []
    File.readlines(filename).each do |line| 
      line = line.strip.split(', ', 2)
      scores << line[0]
      titles << line[1]
    end

    scores.map!(&:to_i)

    combine = scores.zip(titles).each{ |item| insert(item[0], item[1]) }

    combine.size
  end


  def health(depth, current = @root)
    results = sort.map{ |item| item if depth_of(item.keys[0]) == depth }.compact
    results.map! do |item|
      location = get_location(item.keys[0])
      [item.keys[0], size(location), ((size(location).to_f / size) * 100).to_i]

    end
  end


  def size(current = @root)
    size = 1
    size += size(current.left) unless current.left.nil?
    size += size(current.right) unless current.right.nil?
    size
  end

  def get_location(number, location = @root)
    if number == location.data.keys[0]
      return location

    elsif number > location.data.keys[0]
      location.right ? get_location(number, location.right) : false

    else
      location.left ? get_location(number, location.left) : false

    end
  end
end
