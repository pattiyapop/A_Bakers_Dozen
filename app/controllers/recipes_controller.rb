class RecipesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :update, :edit, :destroy]
  before_filter :correct_user,   only: [:update, :edit, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    if :search_query
      @recipes = Recipe.search(params[:search_query])
      @recipes = @recipes.sort!{ |x, y| x["created_at"] <=> y["created_at"] }.reverse
    else     
      @recipes = Recipe.find(:all, :order => 'recipes.created_at').reverse
    end
    #@recipes.created_at.strftime("%s").to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/followed_recipes
  # GET /recipes/followed_recipes.json
  def followed_recipes
    #if :search_query
    #  @recipes = Recipe.search(params[:search_query])
    #  @recipes = @recipes.sort!{ |x, y| x["created_at"] <=> y["created_at"] }.reverse
    #else     
    if signed_in?
      current_user.followers.each do |following|
        @recipes = Recipe.find(:all, :user_id => following, :order => 'recipes.created_at').reverse
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @owner = @recipe.user
    @ingredients = @recipe.ingredients.split("\n")
    @instructions = @recipe.instructions.split("\n")
    @date = @recipe.created_at.strftime("%m/%d/%Y")
    #find all comments associated with recipe
    @comments = @recipe.comments.paginate(page: params[:page])
    @chefcertified = false
    @comments.each do |comment|
      if (comment.rating == 4 && comment.user.chef)
         @chefcertified = true
      end
    end
    if @owner.chef
       @chefcertified = true
    end
    #debugger
    #@comments = Comment.find(:all, :recipe_id => @recipe.id)
    #@comments = @recipe.comments.paginate(page: params[:page])
    #    Micropost.where("user_id = ?", id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    #@recipe.user_id = params[:user_id].to_i
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  #changed redirect to go to home page
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = params[:user_id].to_i

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :ok }
    end
  end

  private
    #def correct_user
    #  @recipe = current_user.recipes.find_by(id: params[:id])
    #  redirect_to root_url if @recipe.nil?
    #end
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @recipe = Recipe.find(params[:id])
      @user = User.find(@recipe.user_id)
      redirect_to(recipes_path) unless current_user?(@user)
    end
end
