class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to '/home/login3'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/home/login3'
  end
end