require './lib/node'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = Node.new(nil, nil)
  end

  
  def insert(score, title)
    unless root.score == nil
      root.insert(score, title)
      depth_of(score)
    else
       @root = Node.new(score, title)
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
    file = File.open(filename)
    
    file.readlines.each do |line|
      line = line.strip.split(', ', 2)
      scores << line[0]
      titles << line[1]
      file.close
    end

    scores.map!(&:to_i)

    combine = scores.zip(titles)
    combine.each { |item| insert(item[0], item[1]) }

    combine.size
  end


  def health(deep)
    root.health(deep)
  end
end