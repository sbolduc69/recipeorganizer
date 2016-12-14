class RecipesController < ApplicationController

    def index
      @recipes = Recipe.all
    end
    
    def show
        @recipe = Recipes.find(params[:id])
    end
end