class GoldCoinSurvey < ActiveRecord::Base
  validates_presence_of :user_id, :email
  # validates_uniqueness_of :user_id, :scope => [:event], :message => "You have already submitted this form"

  before_save :check_for_uniqueness

  def check_for_uniqueness
    if GoldCoinSurvey.where('user_id = ? and event = ? and deleted = ?', self.user_id, self.event, false).present?
      self.errors.add(:error, " You have already submitted this form")
      return false
    else
      return true
    end
  end  


  def self.to_csv
    require 'csv'
    CSV.generate do |csv|
      csv << ["USER ID", "USER EMAIL", "CITY", 
              "Q1) What is your Gender ?",
              "Q2) Which age group do you belong to?",
              "Q3) From where do you shop online the most?",
              "Q4) What platform do you prefer for online shopping?",
              "Q5) Have you reduced the frequency of traditional shopping due to online shopping?",
              "Q6) How much in advance do you shop for Diwali?",
              "Q7) How much are you planning to spend on Shopping this Diwali?",
              "Q8) How much of this Spends will be Online vs Offline?",
              "Q9) This Diwali, which are the Top 5 stores you would be shopping from?",
              "Q10) Which is the most comfortable online shopping website? (Rank them in order of your preference)",
              "Q11) What are the top 5 categories you are going to shop online?(Rank them in order of your preference)",
              "Q12) Which payment Method Do you use most often when buying online ? (Rank them in order of your preference)",
              "Q13) Which website has given you a bad experience in past?",
              "Q14) How much do you plan to spend online for gifting others this Diwali Season? ",
              "Q15) This Diwali would you prefer gift cards over gift items ?",
              "Q16) Which store gift card would you prefer to buy for gifting?(Rank them in order of your preference)",
              "Q17) What is the average value of Gift Card you will buy for gifting this Diwali?",
              "Q18) Would you be willing to buy refurbished products online if price is good. (A refurbished product is who’s box is opened for various reasons but professionally restored to working order by the brand or its certified agents. Hence the phone has been inspected, cleaned & repaired to meet brand specifications. With typically a 6 months warranty)"
              ]
      all.each do |g|
        csv << [g.user_id, g.email, g.city, g.question_1, g.question_2, g.question_3, g.question_4, g.question_5, g.question_6, g.question_7, g.question_8, g.question_12, g.question_21, g.question_22, g.question_23, g.question_15, g.question_9, g.question_10, g.question_24, g.question_11, g.question_13]
      end
    end
  end

end
