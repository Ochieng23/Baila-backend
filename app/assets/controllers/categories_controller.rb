class CategoriesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def index 
        categories = Category.all 
        render json: categories, status: :ok 
    end 

    def show 
        category = Category.find(params[:id])
        render json: category, status: :ok
    end 
    

    def create
        category = Category.create!(category_params)
        render json: category, status: :created
      rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

    

    private 
    def render_not_found
        render json: {errors:"Category not found"}, status: :not_found
    end 
    def category_params
        params.require(:category).permit(:name, :description)
      end
end
