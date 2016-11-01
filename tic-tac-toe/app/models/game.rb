class Game < ApplicationRecord
  belongs_to :user

  def computer_move(game)
    if game.index(nil)
       game[game.index(nil)] = 'O'
    end
    game
  end

end
