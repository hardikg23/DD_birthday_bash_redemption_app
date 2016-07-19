class CreateGoldCoinSurveys < ActiveRecord::Migration
  def change
    create_table :gold_coin_surveys do |t|
      t.integer :user_id
      t.string :email
      t.string :city
      t.float :latitude
      t.float :longitude
      t.string :question_1
      t.string :question_2
      t.string :question_3
      t.string :question_3_input
      t.string :question_4
      t.string :question_5
      t.string :question_5_input
      t.string :question_6
      t.string :question_7
      t.string :question_7_input
      t.string :question_8
      t.string :question_9
      t.string :question_10
      t.string :question_11
      t.string :question_12, array: true
      t.string :question_13
      t.string :question_13_input
      t.string :question_14
      t.string :question_15, array: true
      t.string :question_15_input
      t.string :question_16
      t.string :question_16_input
      t.string :question_16_w_input
      t.string :question_17
      t.string :question_17_input
      t.string :question_18
      t.string :question_18_input
      t.string :question_19
      t.string :question_20

      t.timestamps null: false
    end
  end
end
