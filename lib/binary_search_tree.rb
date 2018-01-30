require './lib/node'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  
  def insert(score, title)
    if root.nil?
      @root = Node.new(score, title)
      depth_of(score)
    elsif include?(score)
      "Value already exists."
    else
      root.insert(score, title)
      depth_of(score)
    end
  end


  def include?(score)
    root.include?(score)
  end

  
  def depth_of(score)
    location = root.find_value(score)
    location.depth
  end

  
  def sort
    root.sort
  end

  
  def size
    root.size
  end


  def min
    root.min
  end


  def max
    root.max
  end


  def load(filename)
    scores = []
    titles = []
    imported = 0
    file = File.open(filename)

    file.readlines.each do |line|
      line = line.strip.split(', ', 2)
      scores << line[0]
      titles << line[1]
      file.close
    end

    scores.map!(&:to_i)

    combine = scores.zip(titles)
    combine.each do |item| 
      ignore = insert(item[0], item[1])
      imported += 1 unless ignore == "Value already exists."
    end
    imported
  end


  def health(deep)
    root.health(deep)
  end
end