class CreateSurveys < ActiveRecord::Migration
  enable_extension "hstore"
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.string :email
      t.string :city
      t.float :latitude
      t.float :longitude
      t.hstore :questions
      t.string :survey_type

      t.timestamps null: false
    end
  end
end
