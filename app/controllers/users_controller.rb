#just coped and pasted from hw3 for now
class UsersController < ApplicationController
 
#userpage
  def show
    username = params[:username] # retrieve movie ID from URI route
    @user = User.find(username) # look up user by unique username
    # will render app/views/users/show.<extension> by default
  end

#homepage
  def index
    @recipies = Recipe.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
