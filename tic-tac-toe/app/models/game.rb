class Game < ApplicationRecord
  belongs_to :user

 def has_winner?
   byebug
   @game = {[0,0] =>  'X',[0,1] => '' ,[0,2] => 'O',
           [1,0] =>  '',[1,1] => 'X' ,[1,2] => 'O',
           [2,0] =>  'O',[2,1] => '' ,[2,2] => 'X'}

   return true if has_winner_col_lines?(@game) || has_winner_diagonals?(@game)
 end

  def has_winner_col_lines?(game)
    result = false
    2.times do |line_col|
      3.times do |index|
        line = game.find_all{|k,v| k[line_col] == index}.to_h.values
        if  line == ['X','X','X']
          result =  true
        elsif line == ['O','O','O']
          result = true
        end
      end
    end
    result
  end

  def has_winner_diagonals?(game)
    return true if (([game[[0,0]],game[[1,1]],game[[2,2]]] == ["X","X","X"] || [game[[0,0]],game[[1,1]],game[[2,2]]] == ["O","O","O"]) ||
                    ([game[[2,0]],game[[1,1]],game[[0,2]]] == ["X","X","X"] || [game[[2,0]],game[[1,1]],game[[0,2]]] == ["O","O","O"]))
  end

  def computer_time(game)
    if game[[1,1]] == ''
      game[[1,1]] = 'O'
    else
      game = best_bet(game)
    end
  end

  def best_bet(game)
    if can_i_win?
      game = ""
    elsif user_can_win?
      game = ""
    end
    game
  end

  def can_i_win?
    result = false
    2.times do |line_col|
      3.times do |index|
        line = game.find_all{|k,v| k[line_col] == index}.to_h.values
        if  line.count{|v| v == 'O'} == 2 && line.count{|v| v == ''} == 1
            result =  true
        end
      end
    end
    result
  end

  def user_can_win?
    result = false
    2.times do |line_col|
      3.times do |index|
        line = game.find_all{|k,v| k[line_col] == index}.to_h.values
        if  line.count{|v| v == 'X'} == 2 && line.count{|v| v == ''} == 1
            result =  true
        end
      end
    end
    result
  end

end
