class RecipesController < ApplicationController

    def index
      @recipes = Recipe.all
    end
    
    def show
      @recipe = Recipe.find(params[:id])
    end
    
    def new
    @recipe = Recipe.new
    end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user
    
    if @recipe.save
      flash[:success] = "Your recipe was created successfuly"
      redirect_to recipes_path
    else 
      render :new
    end
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture, style_ids: [], ingredient_ids: [])
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    
    def require_same_user
      if current_user != @recipe.chef
        flash[:danger] = "You can only edit your own recipes"
        redirect_to root_path
      end
      
    end  
    
    def require_user_like
      if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_to :back
      end
    end


end

  def edit
      
  end

