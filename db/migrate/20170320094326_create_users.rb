class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.string :government_id, null: false 
      t.string :location, null: false
      t.string :gender, null: false
      t.string :birthday, null: false
      t.text :autobiography, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.timestamps null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
