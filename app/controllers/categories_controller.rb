class CategoriesController < ApplicationController 
  before_action :redirect_if_not_logged_in?
  before_action :find_category, only: [:show, :update, :edit, :destroy]

    def index
        @categories = Category.order_by_name.uniq
    end

    def show
      
    end

    def new
        @category = Category.new
        c = @category.appointments.build 
        c.build_physician
       
        
    end

    def create
         @category = Category.new(category_params)
         if @category.save 
           redirect_to categories_path
         else
           render :new
         end
    end

    def edit
        
    end

    def update
        @category.update(category_params)
        if @category.valid?
          redirect_to category_path(@category)
        else
          render :edit
        end
    end
    private
    def category_params
        params.require(:category).permit(:name, :appointment_id)
    end
    def find_category
       @category = Category.find(params[:id])

    end
        
end
