module SessionsHelper

  def sign_in(user)
#Here we follow the desired steps: first, create a new token; second, place the unencrypted token in the browser cookies; third, save the encrypted token to the database; fourth, set the current user equal to the given user.
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token #remembered
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

#set current user
  def current_user=(user)
    @current_user = user
  end

#get current user
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    #set the @current_user instance variable to the user corresponding to the remember token, but only if @current_user is undefined:
    @current_user ||= User.where(remember_token: remember_token).first
  end

#check if current user is signed in
  def signed_in?
    !current_user.nil?
  end

#sign out: we set the current user to nil and use the delete method on cookies to remove the remember token from the session
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

#needed for linking users and comments
  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
end
