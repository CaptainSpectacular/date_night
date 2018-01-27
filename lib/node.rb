
class Node
  attr_accessor :data, :left, :right

  def initialize(score, title)
    @data = {score => title}
  end

  def children
    [left,right].compact
  end

  def inspect
    "{#{data}::\n#{left.inspect}:\n#{right.inspect}}"
  end

end