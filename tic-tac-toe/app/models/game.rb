class Game < ApplicationRecord
  belongs_to :user

  def computer_move(game)
    if game.index("")
       game[game.index("")] = 'O'
    end
    game
  end

end
