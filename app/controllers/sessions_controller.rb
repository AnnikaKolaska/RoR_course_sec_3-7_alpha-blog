class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # create session
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "E-mail or password is wrong"
      render 'new'
    end
  end

  def destroy
  end

end
