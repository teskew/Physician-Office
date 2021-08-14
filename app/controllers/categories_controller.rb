class CategoriesController < ApplicationController 
  before_action :redirect_if_not_logged_in
    def index
        @categorys = Category.all
    end

    def show
        @category = Category.find_by_id(params[:id])
    end

    def new
        @category = Category.new
        c = @category.appointments.build 
        c.build_physician
    end

    def create
         @category = Category.new(category_params)
         if @category.save 
           redirect_to categorys_path
         else
           render :new
         end
    end

    def edit
        @category = Category.find_by_id(params[:id])
    end

    def update
        @category = Category.find_by_id(params[:id])
        @category.update(category_params)
        if @category.valid?
          redirect_to category_path(@category)
        else
          render :edit
        end
    end
    private
    def category_params
        params.require(:category).permit(:name)
    end
        
end
