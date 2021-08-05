class PhysiciansController < ApplicationController 
    def index  
        @physicians = Physician.all
    end

    def show
        @physician= Physician.find_by_id(params[:id])
        redirect_to to physician_path if !@physician
    end

    def new 
        @physician = Physician.new
    end

    def create 
        @physician = Physician.new(physician_params)
      
        if @physician.save
            redirect_to physicians_path
        else
            render :new
        end
    end

    private 

    def physician_params
        params.require(:physician).permit(:name, :email)
    end
    
    

       
end