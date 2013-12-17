class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy, :following, :followers]
  before_filter :correct_user,   only: [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if @user.picture == nil
      @user.picture = "defaultprofile.png"
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  #-------------------------------------------------

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.picture == nil
      @user.picture = "defaultprofile.png"
    end
    respond_to do |format|
      if @user.save
        sign_in @user #when they sign up, sign them in
        flash[:success] = "Welcome to A Baker's Dozen!"
        format.html { redirect_to @user, notice: "Welcome to A Baker's Dozen, "+@user.name+"!" }
        format.json { render json: @user, status: :created, location: @user }
      else #sign-up failure
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.picture == nil
      @user.picture = "defaultprofile.png"
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Information updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

#--------------------------------------------
  private
    def user_params
      params.require(:user).permit(:name, :username, :password,
                                   :password_confirmation)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(recipes_path) unless current_user?(@user)
    end
end



#user = User.find_by(email: email)
#current_user = user.authenticate(password): returns user or false
