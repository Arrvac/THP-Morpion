class Application
    attr_accessor :game
    def print_header
        puts '==================================================='
        puts '||                                               ||'
        puts '||               MORPION TROP COOL               ||'
        puts '||                                         nveron||'
        puts '==================================================='
        puts
    end
    def start(name1, name2)
        game = Game.new(name1, name2)
        game.def_player_sign
        game.gameplay
    end
    def another
        print "Want to play another game ? (y) or (n) : "
        choice = gets.chomp
        return 1 if choice == 'y'
        return 0 if choice == 'n'
    end
    def initialize
        system "clear"
        print_header
        print 'Name of Player 1: '
        name1 = gets.chomp
        print 'Name of Player 2: '
        name2 = gets.chomp
        while true
            start(name1, name2)
            break if another == 0
            puts
        end
    end
end