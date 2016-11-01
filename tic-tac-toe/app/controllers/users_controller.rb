class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    if @user = User.new(user_params)
      if @user.save
        session[:id] = @user.id
        @game = Game.new
        render :show
      else
        @errors = @user.errors.full_messages
        render :new
      end
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(session[:id])
    @game = Game.new
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end
