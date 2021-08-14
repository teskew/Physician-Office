class Appointment < ApplicationRecord
     belongs_to :physician
     belongs_to :category
     accepts_nested_attributes_for :physician, reject_if: proc { |attributes| attributes['name'].blank? || attributes['email'].blank?}
  accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }
  
  def appointment_attributes=(appointment_hash)
  if !appointment_hash[:name].blank? && !appointment_hash[:address].blank?
    self.appointment = Appointment.find_or_create_by(appointment_hash)
  end
end

    # => "December 04, 2007 00:00"
    def convert_datetime_to_long_format
        self.appointment_datetime.to_formatted_s(:long)
    end

    def convert_datetime_to_readable
        self.convert_datetime_to_long_format.split.insert(3,"at").join(" ")
    end
    
end
    

