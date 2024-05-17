module BracketTree
  class Node
    attr_accessor :left, :right, :position, :payload, :depth

    def initialize position, payload = nil
      @position = position
      @payload = payload
    end

    def method_missing(sym, *args, &block)
      @payload.send sym, *args, &block
    end

    def self.from_h(hash)
      node = Node.new(hash[:position], hash[:payload])
      node.instance_variable_set(:@left, from_h(hash[:left])) if hash[:left]
      node.instance_variable_set(:@right, from_h(hash[:right])) if hash[:right]

      node
    end

    def to_h
      {
        position: @position,
        payload: @payload,
        left: @left ? @left.to_h : nil,
        right: @right ? @right.to_h : nil,
        depth: @depth ? @depth : nil
      }
    end

  end
end
