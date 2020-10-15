class BoardCase
  attr_accessor :x, :y, :value
  def initialize(value_tmp)
    @value = value_tmp
  end
  def def_sign(value_tmp)
    @value = value_tmp
  end
end

class Board
  attr_accessor :case
  def initialize
    @case = Array.new
    9.times do |i|
      @case << BoardCase.new(' ')
    end
  end
  def show
    system "clear"
    puts '  |  1  |  2  |  3  |'
    show_case(0, 'A')
    show_case(1, 'B')
    show_case(2, 'C')
    puts '---------------------'
  end

  def show_case(x, letter)
    puts '---------------------'
    puts '  |     |     |     |'
    puts "#{letter} |  #{@case[x * 3].value}  |  #{@case[x * 3 + 1].value}  |  #{@case[x * 3 + 2].value}  |"
    puts '  |     |     |     |'
  end

  def change_sign_case(index, value_tmp)
    @case[index].value = value_tmp
  end
end
