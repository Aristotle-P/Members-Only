class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      flash[:danger] = "Wrong password or email"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
