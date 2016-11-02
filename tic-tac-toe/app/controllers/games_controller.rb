class GamesController < ApplicationController

  def show
    @game = Game.find_by(id: params[:id])
  end

  def create
    if @user = User.find_by(id: params[:user_id])
      @game = Game.new(user: @user)
      @game.save
      redirect_to user_game_path(@user.id, @game.id)
    else
      @errors = ['You must be logged in']
      redirect_to welcome_index_path
    end
  end

  def five
    if @user = User.find_by(id: params[:id])
      @game = Game.new(user: @user)
      @game.save
      @five = true
      render :'/games/show'
    else
      @errors = ['You must be logged in']
      redirect_to welcome_index_path
    end
  end


  def get_computer_move
    @game = Game.find_by(id: params[:id])
    board = params[:squares]
    render json: @game.computer_move(board)
  end

  def get_computer_move_five
    @game = Game.find_by(id: params[:id])
    board = params[:squares]
    render json: @game.computer_move_five(board)
  end


  def save
    @game = Game.find_by(id: params[:id])
    winner = (params[:winner] == 'X')
    @game.update(end_time: Time.now, won: winner)
    render json: @game
  end

end
