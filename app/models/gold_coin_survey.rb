class GoldCoinSurvey < ActiveRecord::Base
  validates_presence_of :user_id, :email
  validates_uniqueness_of :user_id, :message => "You have already submitted this form"

  def self.to_csv
    require 'csv'
    CSV.generate do |csv|
      csv << ["USER ID", "USER EMAIL", "CITY", 
              "1) Gender", 
              "2) Which age group you belong to?", 
              "3) Where do you buy products on Internet?", 
              "3) Other Reason", 
              "4) How would you rate your internet connection?", 
              "5) Which device do you prefer to buy products on internet?", 
              "5) Other Reason", 
              "6) Have you reduced the frequency of traditional shopping due to online shopping?",
              "7) How much in advance do you shop for Diwali?",
              "7) Other Reason", 
              "8) How much are you planning to spend for Diwali Shopping?",
              "9) How much of this Spends will be Online vs Offline",
              "10) Has this increased as compared to your spends in 2014 during Diwali? If yes by what %?",
              "11) Off the Online Spends, how much do you think it will be through Mobile Apps?",
              "12) Which are the Top 5 stores you would be shopping this Diwali",
              "13) Which online website are you most comfortable when buying online.",
              "13) Other Reason", 
              "14) How likely is that you would recommend this website to your friends/colleagues/relatives, with 5 being the most likely?",
              "15) What are the top 5 categories you are going to shop online ",
              "15) Other Reason", 
              "16) Which payment Method Do you use most often when buying online",
              "16) Other Reason", 
              "17) What are your biggest concerns when buying online this Diwali?",
              "17) Other Reason", 
              "18) Which website would you rate as bad in after sales experience.",
              "18) Other Reason",
              "19) How much do you plan to spend online for gifting others this Diwali Season?",
              "20) Would you be willing to buy refurbished products online if price is good."]
      all.each do |g|
        csv << [g.user_id, g.email, g.city, g.question_1, g.question_2, g.question_3, g.question_3_input, g.question_4, g.question_5, g.question_5_input, g.question_6, g.question_7, g.question_7_input, g.question_8, g.question_9, g.question_10, g.question_11, g.question_12, g.question_13, g.question_13_input, g.question_14, g.question_15, g.question_15_input, g.question_16, g.question_16_input, g.question_17, g.question_17_input, g.question_18, g.question_18_input, g.question_19, g.question_20]
      end
    end
  end

end
