class PhysiciansController < ApplicationController 
    before_action :redirect_if_not_logged_in
    before_action :find_physician, only: [:show, :update, :edit, :destroy]
    def index  
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @physicians = @user.physicians.all
          else
            flash[:message] = "The user doesn't exist" if params[:user_id]
            @physicians = Physician.all
          end
    end

    def show
        redirect_to physicians_path if !@physician
    end

    def new 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @physician = Physician.new(user_id: params[:user_id])
            p = @physician.appointments.build 
             p.build_category
             else
                @error = "The user doesn't exist!!" if !params[:user_id]
                @physician= Physician.new
                @physician.appointments.build
             end
    end

    def create 
   
        @physician= current_user.physicians.build(physician_params)
        @physician.user_id = session[:user_id]
        if @physician.save
            redirect_to physician_path(@physician)
        else
            render :new
        end
    end
    def edit 
        redirect_to physician_path  if !@physician || @physician.user != current_user
    end

    def update 
        redirect_to physician_path  if !@physician || @physician.user != current_user
        @physician.update(physician_params)
        if @physician.valid?
            redirect_to physician_path(@physician)
        else
            render :edit
        end
    end

    def destroy 
        @physician.destroy 
        redirect_to physicians_path
    end
      
    private 

    def physician_params
        params.require(:physician).permit(:name, :email, :user_id, :physician_id, category_ids:[], user_attributes:[:username], appointments_attributes: [:date, :category_id, categories_attributes: [:name]])
    end
        def find_physician
            @physician= Physician.find_by_id(params[:id])
        end
   
    end
       
