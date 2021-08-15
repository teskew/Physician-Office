class Category < ApplicationRecord
    has_many :appointments
    has_many :physicians, through: :appointments

    accepts_nested_attributes_for :physicians
    accepts_nested_attributes_for :appointments

    def category_attributes=(category_hash)
        if !category_hash[:name].blank? 
        self.category = category.find_or_create_by(category_hash)
        end
    end
end
