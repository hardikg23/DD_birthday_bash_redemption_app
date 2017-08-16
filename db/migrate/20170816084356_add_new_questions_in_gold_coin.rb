class AddNewQuestionsInGoldCoin < ActiveRecord::Migration
  def change
    add_column :gold_coin_surveys, :question_21, :hstore, default: {}, null: false
    add_column :gold_coin_surveys, :question_22, :hstore, default: {}, null: false
    add_column :gold_coin_surveys, :question_23, :hstore, default: {}, null: false
    add_column :gold_coin_surveys, :question_24, :hstore, default: {}, null: false
  end
end
