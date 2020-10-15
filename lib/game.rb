class Game
    attr_accessor :player1, :player2, :board
    def initialize(name1, name2)
        @player1 = Player.new(name1)
        @player2 = Player.new(name2)
        @board = Board.new
    end

    def def_player_sign
        system "clear"
        puts "#{player1.name}, choose your sign (1 char):"
        print '> '
        sign = gets.chomp.to_s
        while sign[0] == ' ' || sign[0] == nil
            puts "Error: Sign can't be a space, choose another one"
            print '> '
            sign = gets.chomp.to_s
        end
        puts "#{player2.name}, choose your sign (1 char):"
        print '> '
        sign2 = gets.chomp.to_s
        while sign2[0] == ' ' || sign2[0] == nil
            puts "Error: Sign can't be a space, choose another one"
            print '> '
            sign2 = gets.chomp.to_s
        end
        while sign[0] == sign2[0]
            puts "Error: Same sign than #{player1.name}, choose another one"
            print '> '
            sign2 = gets.chomp.to_s
        end
        player1.sign = sign[0]
        player2.sign = sign2[0]
    end

    def def_index(choose)
        if choose[0] == 'A'
            return (0 * 3 + choose[1].to_i - 1)
        elsif choose[0] == 'B'
            return (1 * 3 + choose[1].to_i - 1)
        else
            return (2 * 3 + choose[1].to_i - 1)
        end
    end

    def place_without_error(player)
        while true
            print "#{player.name}, choose your case: "
            choose = gets.chomp
            if choose[0] != 'A' && choose[0] != 'B' && choose[0] != 'C'
                puts "Error: Index unfound (#{choose})"
            elsif choose[1] != '1' && choose[1] != '2' && choose[1] != '3'
                puts "Error: Index unfound (#{choose})"
            elsif @board.case[def_index(choose)].value != ' '
                puts "Error: case already use, Don't try to cheat ! (#{choose})"
            else
                return choose
            end
        end
    end

    def play(player)
        choose = place_without_error(player)
        @board.change_sign_case(def_index(choose), player.sign)
    end

    def victory?
        return 1 if @board.case[0].value == @board.case[1].value && @board.case[1].value == @board.case[2].value && @board.case[2].value != ' ' && @board.case[0].value != ' '
        return 1 if @board.case[3].value == @board.case[4].value && @board.case[4].value == @board.case[5].value && @board.case[5].value != ' ' && @board.case[3].value != ' '
        return 1 if @board.case[6].value == @board.case[7].value && @board.case[7].value == @board.case[8].value && @board.case[8].value != ' ' && @board.case[6].value != ' '
        return 1 if @board.case[0].value == @board.case[3].value && @board.case[3].value == @board.case[6].value && @board.case[6].value != ' ' && @board.case[0].value != ' '
        return 1 if @board.case[1].value == @board.case[4].value && @board.case[4].value == @board.case[7].value && @board.case[7].value != ' ' && @board.case[1].value != ' '
        return 1 if @board.case[2].value == @board.case[5].value && @board.case[5].value == @board.case[8].value && @board.case[8].value != ' ' && @board.case[2].value != ' '
        return 1 if @board.case[0].value == @board.case[4].value && @board.case[4].value == @board.case[8].value && @board.case[8].value != ' ' && @board.case[0].value != ' '
        return 1 if @board.case[2].value == @board.case[4].value && @board.case[4].value == @board.case[6].value && @board.case[6].value != ' ' && @board.case[2].value != ' '
        @board.case.each { |i| return 0 if i.value == ' '}
        return 2
    end

    def victory(player)
        puts
        puts "Victoire de #{player.name} ! Bien joué champion !"
        puts
    end

    def egal
        puts
        puts "Egalite dommage..."
        puts
    end

    def gameplay
        board.show
        while true
            play(@player1)
            board.show
            if victory? >= 1
                victory(@player1) if victory? == 1
                egal if victory? == 2
                break
            end
            play(@player2)
            board.show
            if victory? >= 1
                victory(@player2) if victory? == 1
                egal if victory? == 2
                break
            end
        end
    end
end