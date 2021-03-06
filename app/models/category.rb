class Category < ApplicationRecord
    has_many :appointments
    
    has_many :physicians, through: :appointments
    accepts_nested_attributes_for :appointments
   

    validates :name, presence: true

    scope :order_by_name, -> {order(:name)}
    def category_attributes=(category_hash)
        if !category_hash[:name].blank? 
        self.category = category.find_or_create_by(category_hash)
        end
    end
  

    # def name
    #     #{self.name} 
    # end
    


    
end
