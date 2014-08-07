class SessionsController < ApplicationController

  skip_filter :ensure_logged_in, only: [:new, :create]
  
  def new
  end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])

    if user
      session[:user_id] = user.id
      redirect_to users_path
    else
      render :new, notic: "Incorrect email or password."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
