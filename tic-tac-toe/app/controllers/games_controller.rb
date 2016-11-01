class GamesController < ApplicationController

  def show
  end

  def create
    if @user = User.find_by(id: params[:user_id])
      @game = Game.new(user: @user)
      @game.save
      render :show
    else
      @errors = ['You must be logged in']
      redirect_to welcome_path
    end
  end


  def get_computer_move
    @game = Game.find_by(id: params[:id])
    board = game_params[:game]
    @game.computer_move(board)
  end

end
