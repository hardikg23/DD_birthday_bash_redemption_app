class GoldCoinSurvey < ActiveRecord::Base
  validates_presence_of :user_id, :email

  def self.to_csv
    require 'csv'
    CSV.generate do |csv|
      csv << ["USER ID", "USER EMAIL"]
      all.each do |g|
        csv << [g.user_id, g.email, g.question_1, g.question_2, g.question_3, g.question_3_input, g.question_4, g.question_5, g.question_5_input, g.question_6, g.question_7, g.question_7_input, g.question_8, g.question_9, g.question_10, g.question_11,g.question_13, g.question_13_input, g.question_14,g.question_15_input, g.question_16, g.question_16_input, g.question_17, g.question_17_input, g.question_18, g.question_18_input, g.question_19, g.question_20, g.question_12, g.question_15]
      end
    end
  end

end
