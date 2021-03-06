class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.boolean :is_admin, :default => false
      t.string :email
      t.string :image

      t.timestamps
    end
  end
end
