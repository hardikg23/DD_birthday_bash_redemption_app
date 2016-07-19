class CreateRedemptions < ActiveRecord::Migration
  def change
    create_table :redemptions do |t|
      t.string :email
      t.string :name
      t.text :address
      t.string :pin_code
      t.string :contact_number
      t.string :redemption_type
      t.string :t_shirt_size

      t.timestamps null: false
    end
  end
end
