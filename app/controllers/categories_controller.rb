class CategoriesController < ApplicationController
    before_action :authenticate_user!, except: :splash

    def index
      @categories = Category.where(author_id: current_user.id)
      @totals = {}
      @categories.map do |category|
        category.purchases.each do |purchase|
          if @totals[category.id.to_s].nil?
            @totals[category.id.to_s] = purchase.amount
          else
            @totals[category.id.to_s] += purchase.amount
          end
        end
      end
    end
  
    def new
      @category = Category.new
    end
  
    def create
      category = Category.new(category_params)
  
      if category.save
        redirect_to categories_path
      else
        flash[:alert] = 'Category not created'
        render :new
      end
    end
  
    def splash; end
  
    private
  
    def category_params
      params.require(:category).permit(:name, :icon).merge(author_id: current_user.id)
    end
end
