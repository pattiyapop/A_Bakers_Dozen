class RecipesController < ApplicationController
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

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.split("\n")
    @instructions = @recipe.instructions.split("\n")
    @date = @recipe.created_at.strftime("%m/%d/%Y")
    #find all comments associated with recipe
    @comments = @recipe.comments.paginate(page: params[:page])
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
        format.html { redirect_to recipes_path, notice: 'Recipe was successfully created.' }
        format.json { render json: recipes_path, status: :created, location: @recipe }
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
end
