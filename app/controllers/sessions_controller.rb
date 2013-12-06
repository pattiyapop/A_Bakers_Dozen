class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(username: params[:session][:username].downcase).first
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to user
      flash[:notice] = 'Welcome, '+user.name+'!'
    else
      flash.now[:warning] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to recipes_path
    flash[:notice] = 'You have been logged out.'
  end
end
