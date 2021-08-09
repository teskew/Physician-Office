class Physician < ApplicationRecord
    has_many :appointments
    # has_many :users, through: :appointments
    belongs_to :category
    validates :name, presence: true
    validates :email, presence: true
    
    accepts_nested_attributes_for :appointments, reject_if: proc { |attributes| attributes['appointment_datetime'].blank?}

end
