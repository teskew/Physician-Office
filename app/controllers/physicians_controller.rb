class PhysiciansController < ApplicationController 
    before_action :redirect_if_not_logged_in
    
    def index  
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @physicians = @user.physicians.all
          else
            flash[:message] = "The user doesn't exist" if params[:user_id]
            @physicians = Physician.all
          end
    end

    def show
        @physician = Physician.find_by_id(params[:id])
        redirect_to physicians_path if !@Physician
    end

    def new 
            @physician = Physician.new
            t = @physician.appointments.build 
             t.build_category
             #@physician_build_category
    end

    def create 
   
        #@physician = Physician.new(physician_params)
        @physician= current_user.physicians.build(physician_params)
        if @physician.save
            redirect_to physician_path(@physician)
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
        @physician.destroy 
        redirect_to locations_path
    end
      
    private 

    def physician_params
        params.require(:physician).permit(:name, :email, :user_id, category_ids:[], user_attributes:[:username], appointments_attributes: [:date, category_attributes: [:name]])
    
    end
    


       
end