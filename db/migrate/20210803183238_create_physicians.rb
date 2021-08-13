class CreatePhysicians < ActiveRecord::Migration[6.1]
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :email
      t.belongs_to :user
      t.timestamps  
    end
  end
end
