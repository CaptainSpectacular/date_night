
class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(score=nil, title=nil)
    @data = {title => score}
  end

  def children
    [left,right].compact
  end

  def inspect
    "{#{data}::\n#{left.inspect}:\n#{right.inspect}}"
  end

end