class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    if @new_user = User.new(user_params)
      if @new_user.save
        session[:id] = @new_user.id
        render :show
      else
        @errors = @new_user.errors.full_messages
        render :new
      end
    else
      @errors = @new_user.errors.full_messages
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
