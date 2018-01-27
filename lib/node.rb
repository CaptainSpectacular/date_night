require 'pry'
class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(score, title)
    @data = {title => score}
  end

  def children
    [left,right].compact
  end

  def inspect
    "{#{data}::#{left.inspect}:#{right.inspect}}"
  end

end