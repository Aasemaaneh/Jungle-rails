
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end
end