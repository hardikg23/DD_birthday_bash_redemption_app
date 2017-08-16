class AddDeletedInGoldCoin < ActiveRecord::Migration
  def change
    add_column :gold_coin_surveys, :deleted, :boolean, :default => false
    add_column :gold_coin_surveys, :event, :string
  end
end
