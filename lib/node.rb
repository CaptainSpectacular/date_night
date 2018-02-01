class Node
  attr_reader :parent, :score, :title
  attr_accessor :left, :right

  def initialize(score, title, parent = nil)
    @score  = score
    @title  = title
    @parent = parent
  end


  def data
    {@title => @score}
  end


  def inspect
    "#{data}"
  end


  def insert(value, title)
    case value <=> score
    when 1 then go_right(value, title)
    when 0 then "Value already exists."
    when -1 then go_left(value, title)
    end

  end


  def include?(score)
    location = self

    until location.nil?
      case score <=> location.score
      when 1 then location = location.right
      when -1 then location = location.left
      else break
      end
    end

    !location.nil?
  end


  def depth
    depth = 0
    location = self

    until location.parent.nil?
      location = location.parent
      depth += 1
    end
    
    depth
  end


  def max
    current = self
    until current.right.nil?
      current = current.right
    end

    current
  end


  def min
    current = self
    until current.left.nil?
      current = current.left
    end

    current
  end

  
  def find_value(score)
    if include?(score)
      location = self
      until score == location.score
        case score <=> location.score
        when 1 then location = location.right
        when -1 then location = location.left
        when 0 then break
        end
      end

    location

    else
      "Value does not exist."
    end
  end


  def sort
    sort_helper
  end


  def size(start = self)
    size = 1
    size += size(start.left) unless start.left.nil?
    size += size(start.right) unless start.right.nil?
    size
  end


  def health(deep)
    nodes = sort.select { |node| node.depth == deep }

    nodes.map do |node|
      [node.score, node.size, ((node.size.to_f / size) * 100).to_i]
    end
  end


  private


  def sort_helper(current = self, result = [])
    return result if current.nil?

    sort_helper(current.left, result)

    result << current

    sort_helper(current.right, result)
  end


  def go_right(value, title)
    if self.right.nil?
      self.right = Node.new(value, title, self)
    else
      self.right.insert(value, title)
    end

  end


  def go_left(value, title)
    if self.left.nil?
      self.left = Node.new(value, title, self)
    else
      self.left.insert(value, title)
    end
  end
end