require_relative "game"

class AiPlayer
    attr_reader :name
    ALPHA_ARRAY = ("a".."z").to_a

    def initialize(name)
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @name = name
    end

    def alert_invalid_move(letter)
        puts "#{letter} is not a valid move!"
        puts "Your guess must be a letter of the alphabet."
        puts "You must be able to form a word starting with the new fragment.\n"
    end

    def guess(fragment)
        prompt(fragment)
        idx = rand(0..26)
        while !valid_play?(ALPHA_ARRAY[idx],fragment)
            idx = rand(0..26)
        end
     
        ALPHA_ARRAY[idx]
    end

    def valid_play?(letter, fragment)
        return false unless ALPHA_ARRAY.include?(letter)

        potential_fragment = fragment + letter
        @dictionary.any? { |word| word.start_with?(potential_fragment) }
    end

    def inspect
        "AiPlayer: #{name}"
    end

    def to_s
        name
    end

    private

    def prompt(fragment)
        puts "The current fragment is '#{fragment}'."
    end

end
