class PhysiciansController < ApplicationController 
    def index  
        @physicians = Physician.all
    end

    def show
        @physician= Physician.find_by_id(params[:id])
    end

    def new 
        @physician = Physician.new
            appointment = @physician.appointments.build
    end

    def create 
   
        @physician = Physician.new(physician_params)
      
        if @physician.save
            redirect_to physicians_path
        else
            render :new
        end
    end
    def edit 
        @physician = Physician.find_by_id(params[:id])
    end

    def update 
        @physician = Physician.find_by_id(params[:id])
        @physician.update(physician_params)
        if @physician.valid?
            redirect_to physician_path(@physician)
        else
            render :edit
        end
    end

    def destroy 
        @physician = Physician.find_by_id(params[:id])
        
    end
      
    private 

    def physician_params
        params.require(:physician).permit(:name, :email, category_id)
    end
    


       
end