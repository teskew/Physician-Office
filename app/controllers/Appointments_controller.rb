class AppointmentsController < ApplicationController 
    layout "appointement" 
    def index
        if params[:physician_id] && @physician = Physician.find(params[:physician_id])
        @appointments = @physician.appointments
        else 
            @appointments = Appointment.all
    end
    
    def show 
        @appointment= Appointment.find_by_id(params[:id])
    end
     def parse_datetime(hash)
        Time.now.parse("#{parse_date(hash)["date"])} #{hash["hour"]}: #{hash["min"]}")
     end
    def new 
        @appointment = Appointment.new
       # 3.times { @appointment.shoes.build }
    end
    
    def create 
        @appointment = Appointment.new(appointment_params)
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
        if @appointment.valid? 
            @appointment.update(appointment_params)
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
        params.require(:appointment).permit(:appointment_datetime, physicians_attributes: [:name, :email])
    end
    
    
end