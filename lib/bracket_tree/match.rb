module BracketTree
  class Match
    attr_accessor :seats, :winner_to, :loser_to

    def initialize options = {}
      @seats = options[:seats] || []
      @winner_to = options[:winner_to]
      @loser_to = options[:loser_to]
    end

    def include? seat
      @seats.include? seat
    end

    alias_method :governs?, :include?

    def self.from_h(hash)
      new(seats: hash[:seats], winner_to: hash[:winner_to], loser_to: hash[:loser_to])
    end

    def to_h
      {
        seats: @seats,
        winner_to: @winner_to,
        loser_to: @loser_to
      }
    end

  end
end
