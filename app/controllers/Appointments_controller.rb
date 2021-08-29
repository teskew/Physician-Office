class AppointmentsController < ApplicationController 
      
      before_action :redirect_if_not_logged_in?
      before_action :find_appointment, only: [:show, :update, :edit, :destroy]
      layout "appointment" 
     def index
        if params[:physician_id] && @physician = Physician.find_by_id(params[:physician_id])
            @appointments = @physician.appointments
        else
           
            @appointments = Appointment.order_by_date
        end
    end

    def show
        
        if params[:physician_id]
            @appointment = Physician.find_by_id(params[:physician_id]).appointments.find_by_id(params[:id])
        else
            
        end
    end
  
      
    def parse_datetime(hash)
      Time.now.parse("#{prase_date(hash["date"])} #{hash["hour"]} #{hash["hour"]}: #{hash["min"]}")
    end

    def new
           if params[:physician_id] && @physician = Physician.find_by_id(params[:physician_id])
             @appointment = Appointment.new(physician_id: params[:physician_id]) 
             @appointment.build_category
    
            else
            @appointment = Appointment.new
            @appointment.build_physician
            @appointment.build_category
         end
        end
    
    def create
        
        @appointment = Appointment.new(appointment_params)
        if params[:physician_id]
            @physician = Physician.find_by_id(params[:physician_id])
        end
        
        if @appointment.save 
            redirect_to appointment_path(@appointment)
        else
            render :new
        end

    end
    
    def edit 
        if params[:physician_id]
            physician = Physician.find_by(id: params[:physician_id])
            if physician.nil?
              redirect_to physicians_path, alert: "Physician not found."
            else
              @appointment= physician.appointments.find_by(id: params[:id])
              redirect_to physician_appointments_path(physician), alert: "appointment not found." if @appointment .nil?
            end
          else
            
          end
    end 
    
    def update 
        @appointment.update(appointment_params)
        if @appointment.valid? 
            redirect_to appointment_path(@appointment)
        else 
            render :edit
        end
    end 
    
    def destroy 
        
    end
    
    private 
    
    def appointment_params
        params.require(:appointment).permit(:date, :physician_id, physician_attributes: [:name, :email], category_attributes: [:name])
    end


    def find_appointment
        @appointment= Appointment.find(params[:id])

    end

    
end