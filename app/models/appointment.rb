class Appointment < ApplicationRecord
     belongs_to :physician
     belongs_to :category
     accepts_nested_attributes_for :physician, reject_if: proc { |attributes| attributes['name'].blank? || attributes['email'].blank?}
     accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }
    
     validates :date, presence: true 
     
     def appointment_attributes=(appointment_hash)
            if !appointment_hash[:name].blank? && !appointment_hash[:address].blank?
               self.appointment = Appointment.find_or_create_by(appointment_hash)
            end
    end

       

       def physician_name
        self.physician.name
       end

       def user_name
        self.user.name
       end
      
       def name_and_email
        "#{self.physician.name} - #{self.physician.email}"
      end
    
      scope :order_by_date, -> {order(date: :desc)}
  
  
      # def self.order_by_date  
      #   # self.order(:date)
      #   self.order(date: :desc).limit(1)
      # end




    # => "December 04, 2007 00:00"
    def convert_datetime_to_long_format
        self.appointment_datetime.to_formatted_s(:long)
    end

    def convert_datetime_to_readable
        self.convert_datetime_to_long_format.split.insert(3,"at").join(" ")
    end
    
end
    

