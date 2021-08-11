class Appointment < ApplicationRecord
     belongs_to :physician
     belongs_to :user
    
     def physician_name
        self.physician.name
    end

    def user_name
        self.patient.name
    end

    # => "December 04, 2007 00:00"
    def convert_datetime_to_long_format
        self.appointment_datetime.to_formatted_s(:long)
    end

    def convert_datetime_to_readable
        self.convert_datetime_to_long_format.split.insert(3,"at").join(" ")
    end
    
end
    
    

