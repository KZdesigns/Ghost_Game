class Game
    ALPHA = ("a".."z").to_a

    attr_accessor :fragment 
    attr_reader :players, :dictionary
    
    def initialize(player_1, player_2)
        words = File.readlines('half_dictionary.txt')
        @players = [player_1, player_2]
        @fragment = ""
        @dictionary = Set.new(words).map(&:chomp)
    end

    def play_round
        puts "Welcome to ghost!"

        match = false

        while !match
            if @dictionary.include?(@fragment)
                match = true
            else
                self.take_turn(self.current_player)
                self.next_player!
            end
        end

        puts "#{self.previous_player} You LOSE!"
    end

    def current_player
        players.first
    end

    def previous_player
        players.last
    end

    def next_player!
        players.rotate!
    end

    def take_turn(player)
        puts "#{current_player} Enter new letter:"
        new_letter = gets.chomp
        while !valid_play?(new_letter)
            puts "Try again!"
            new_letter = gets.chomp
            new_letter.to_s
        end
        puts "Current word fragment: #{self.fragment}"
    end

    def valid_play?(string)
        return false if !ALPHA.include?(string)
        potential_fragment = fragment + string
        return false if !dictionary.any? { |word| word.start_with?(potential_fragment) }
        @fragment += string
    end



end

