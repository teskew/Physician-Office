class Appointment < ApplicationRecord
    belongs_to :physician
    # belongs_to :user
    accepts_nested_attributes_for :physician
    
    def physicion_attributes=(hash_of_attributes)
       
        if !hash_of_attributes["name"].blank? && !hash_of_attributes["email"].blank?
            self.physicion = Physicion.find_or_create_by(hash_of_attributes)
        end
    end
    def convert_datetime_to_readable
        self.convert_datetime_to_long_format.split.insert(3,"at").join(" ")
    end
       
    
    
end
