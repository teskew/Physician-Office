class Physician < ApplicationRecord
    belongs_to :user
    has_many :appointments
    #has_many categories through: :appointments
    
    validates :name, presence: true
    validates :email, presence: true
    
    accepts_nested_attributes_for :appointments, reject_if: proc { |attributes| attributes['appointment_datetime'].blank?}

end
