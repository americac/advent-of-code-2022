#The Elf finishes helping with the tent and sneaks back over to you. "Anyway, the second column says how the round needs to end: X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. Good luck!"
#
#The total score is still calculated in the same way, but now you need to figure out what shape to choose so the round ends as indicated. The example above now goes like this:
#
#In the first round, your opponent will choose Rock (A), and you need the round to end in a draw (Y), so you also choose Rock. This gives you a score of 1 + 3 = 4.
#In the second round, your opponent will choose Paper (B), and you choose Rock so you lose (X) with a score of 1 + 0 = 1.
#In the third round, you will defeat your opponent's Scissors with Rock for a score of 1 + 6 = 7.
#Now that you're correctly decrypting the ultra top secret strategy guide, you would get a total score of 12.
#
#Following the Elf's instructions for the second column, what would your total score be if everything goes exactly according to your strategy guide?

class Game
  attr_accessor :turn

  def initialize(turn)
    @turn ||= turn.split('')
  end

  def score
    return win_points if i_should_win?
    return draw_points if i_should_draw?
    return loss_points if i_should_lose?
  end

  private

  def i_should_lose?
    player_move == :lose
  end

  def i_should_win?
    player_move == :win
  end

  def i_should_draw?
    player_move == :draw
  end

  def player_points
    return my_winning_points if i_should_win?
    return my_losing_points if i_should_lose?
    my_draw_points
  end

  def my_draw_points
    points[opponent]
  end

  def my_losing_points
    return points[:scissors] if opponent == :rock
    return points[:rock] if opponent == :paper
    points[:paper]
  end

  def my_winning_points
    return points[:paper] if opponent == :rock
    return points[:scissors] if opponent == :paper
    points[:rock]
  end

  def win_points
    points[:win] + player_points
  end

  def loss_points
    points[:loss] + player_points
  end

  def draw_points
    points[:draw] + player_points
  end

  def opponent
    game_mapping[turn.first.to_sym]
  end

  def player_move
    play_mapping[turn.last.to_sym]
  end

  def game_mapping
    {
      "A": :rock,
      "B": :paper,
      "C": :scissors
    }
  end

  def play_mapping
    {
      "Y": :draw,
      "X": :lose,
      "Z": :win
    }
  end

  def points
    {
      rock: 1,
      paper: 2,
      scissors: 3,
      loss: 0,
      draw: 3,
      win: 6
    }
  end
end

input_file = File.open("day2_input.txt")

total_score = 0

file_data = input_file.readlines.map(&:chomp)

file_data.each do |turn|
  game = Game.new(turn)
  total_score += game.score
end

puts "Total score: #{total_score}"

