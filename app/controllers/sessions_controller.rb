class SessionsController < ApplicationController
  def new
  end
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    update_cart({})
    redirect_to root_url, notice: "Logged out!"
  end
end
