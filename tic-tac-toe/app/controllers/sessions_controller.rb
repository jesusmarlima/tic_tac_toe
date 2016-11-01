class SessionsController < ApplicationController

  def create
    if @user = User.find_by(email: params[:sessions][:email])
      if @user.authenticate(params[:sessions][:password])
        session[:id] = @user.id
        redirect_to user_path(id: @user.id)
      else
        @errors = ["Incorrect password"]
        render new_session_path
      end
    else
      @errors = ["Couldn't find User"]
      render new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to welcome_index_path
  end


  private

  def session_params
    params.require(:sessions).permit(:email, :password)
  end

end
