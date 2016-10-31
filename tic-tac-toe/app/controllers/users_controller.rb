class UsersController < ApplicationController

  def index
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
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end
