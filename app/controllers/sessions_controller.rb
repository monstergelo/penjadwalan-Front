class SessionsController < ApplicationController
  def create
    begin
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      name = user.name
      flash[:success] = "Welcome, " + name + "!"
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session[:user_id] = nil
      flash[:success] = 'See you!'
      redirect_to login_path
    end
  end
end