class CreatePhysicians < ActiveRecord::Migration[6.1]
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :email
      t.integer :user_id
      t.timestamps 
    end
  end
end
