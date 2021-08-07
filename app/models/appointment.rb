class Appointment < ApplicationRecord
    belongs_to :physician
    belongs_to :user
    accepts_nested_attributes_for :physicion
    
    def physicion_attributes=(hash_of_attributes)
        # byebug
        if !hash_of_attributes["name"].blank? && !hash_of_attributes["email"].blank?
            self.physicion = Physicion.find_or_create_by(hash_of_attributes)
        end
    end

    
end
