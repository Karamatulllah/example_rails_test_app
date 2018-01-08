class SessionsController < ApplicationController
  def new

  end
  def create

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have log in successfully!!"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "somthing went wrong with logg in credentials"
      render 'new'

    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "you have log out successfully !! "
    redirect_to root_path

  end

end
