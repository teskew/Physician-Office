class CategoriesController < ApplicationController 
    def index
        # if params[:physician_id] && @physician = Physician.find_by_id(params[:physician_id])
        #    @categories = @physician.categories
        # else 
            @categories= Category.all
        # end
    end
    
    def show 
        @category= Category.find_by_id(params[:id])
    end

    def new 
        @category= Category.new
        3.times { @category.physicians.build }
end
    # def category_order
    #     @category = category.all.order(category_datetime)
    #     render :index

    #  end
  
      
    

    
    
    def create 
        @category= Category.new(category_params)
    
        if @category.save

            redirect_to categories_path
        else
            render :new
        end
    end
    
    def edit 
        @category = Category.find_by_id(params[:id])
    end 
    
    def update 
        @category= Category.find_by_id(params[:id])
        @appointement.update(appointement_params)
        if @category.valid? 
           
            redirect_to category_path(@category)
        else 
            render :edit
        end
    end 
    
    def destroy 
        @category = Category.find_by_id(params[:id])
    end
    
    private 
    
    def category_params
        params.require(:category).permit(:name)
    end
    
    
end