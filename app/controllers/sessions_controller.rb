class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    user = User.find_by(name: params[:user]["name"])
    if user
      session[:user_id] = user.id
      redirect_to session.delete(:return_to) || root_url
    else
      session.delete(:return_to)
      flash.now.alert = 'Invalid character!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
