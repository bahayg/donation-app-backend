class CreateCharities < ActiveRecord::Migration[6.0]
  def change
    create_table :charities do |t|
      t.integer :user_id
      t.string :name
      t.string :image
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
