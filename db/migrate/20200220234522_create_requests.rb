class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user
      t.references :charity
      t.string :expiration_date
      t.string :info
      t.string :status, default: 'open'

      t.timestamps
    end
  end
end
