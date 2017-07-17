class AddDdIdAndYearInRedemption < ActiveRecord::Migration
  def change
    add_column :redemptions, :app_user_id, :integer
    add_column :redemptions, :event, :string
  end
end
