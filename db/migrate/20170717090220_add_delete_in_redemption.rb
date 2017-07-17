class AddDeleteInRedemption < ActiveRecord::Migration
  def change
    add_column :redemptions, :deleted, :boolean, :default => false
  end
end
