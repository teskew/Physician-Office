class AppointmentsController < ApplicationController 
   
    def index
        if params[:physician_id] && @physician = Physician.find_by_id(params[:physician_id])
           @appointments = @physician.appointments
        else 
            @appointments = Appointment.all
        end
    end
    
    def show 
        @appointment= Appointment.find_by_id(params[:id])
    end
    # def appointment_order
    #     @appointment = appointment.all.order(appointment_datetime)
    #     render :index

    #  end
  
      
    def parse_datetime(hash)
      Time.now.parse("#{prase_date(hash["date"])} #{hash["hour"]} #{hash["hour"]}: #{hash["min"]}")

    end

    def new 
        if params[:physician_id] && @physician = Physician.find_by_id(params[:physician_id])
        @appointment = @physician.appointments.build
        else
            @appointment = Appointment.new
            @appointment.build_physician

        end
    end
    
    def create 
        @appointment= Appointment.new(appointment_params)
    
        if @appointment.save

            redirect_to appointments_path
        else
            render :new
        end
    end
    
    def edit 
        @appointment = Appointment.find_by_id(params[:id])
    end 
    
    def update 
        @appointment= Appointment.find_by_id(params[:id])
        @appointement.update(appointement_params)
        if @appointment.valid? 
           
            redirect_to appointment_path(@appointment)
        else 
            render :edit
        end
    end 
    
    def destroy 
        @appointment = Appointment.find_by_id(params[:id])
    end
    
    private 
    
    def appointment_params
        params.require(:appointment).permit(:appointment_datetime, :user_id, :physician_id, physician_attrubute: [:name, :email])
    end
    
    
end