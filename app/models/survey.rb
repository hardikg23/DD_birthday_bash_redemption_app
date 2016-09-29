class Survey < ActiveRecord::Base
  validates_presence_of :user_id, :email
  validates_uniqueness_of :user_id, :message => "You have already submitted this form"

  HEADERS = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11","11_other", "11_reason", "12", "13", "14", "14_wallet", "15", "16", "16_reason", "17", "18", "19", "20", "21", "22", "23"]

  def self.to_csv
    require 'csv'
    CSV.generate do |csv|
      csv << ["USER ID", "USER EMAIL", "CITY", 
              "1) Where do you buy products on Internet ", 
              "2) How would you rate your internet connection when buying online?", 
              "3) Which device do you prefer to buy products on internet?", 
              "4) Have you reduced the frequency of traditional shopping due to online shopping?", 
              "5) How much in advance do you shop for Diwali?", 
              "6) How much are you planning to Spend for Diwali Shopping",
              "7) How much of this Spends will be Online vs Offline",
              "8) Has this increased as compared to your spends in 2014 during diwali? If yes by what %? ",
              "9) Of the Online Spends, how much do you think it will be through Mobile Apps?",
              "10) Which are the Top 5 stores you would be shopping this Diwali ",
              "11) Which online website are you most comfortable when buying online.",
              "11) Others",
              "11) Reason",
              "12) How likely is that you would recommend this website to your friends/colleagues/relatives, with 5 being the most likely?",
              "13) What are the top 5 categories you are going to shop online this Diwali.",
              "14) Which payment Method Do you use most often when buying online",
              "14) Wallets",
              "15) What are your biggest concerns when buying online this Diwali?",
              "16) Which website would you rate as bad in after sales experience.",
              "16) Other Reason", 
              "17) How much do you plan to spend online for gifting others this Diwali Season.",
              "18) Would you be willing to buy refurbished products online if price is good. (A refurbished product is who’s box is opened for various reasons but professionally restored to working order by the brand or its certified agents. Hence the phone has been inspected, cleaned & repaired to meet brand specifications. With typically a 6 months warranty)",
              "19) How much would you shop during sale season vs off-sale season.",
              "20) Customer satisfaction / complaints and redressal to customer complaints for products purchased during sale (Rate from 1 to 5)",
              "21) Which e-comm website has better customer service as per your experience",
              "22) Do you think the refund / exchange procedure of these online shopping sites is customer friendly and easy to understand?",
              "23) Do you think online shopping sites is the best platform for all the window-shoppers? Do you generally, check the product online, see the review and price then go and buy it from the shop?"]
      all.each do |g|
        csv << [g.user_id, g.email, g.city, JSON.parse(g.questions["1"]).join(' or '), g.questions["2"], JSON.parse(g.questions["3"]).join(' or '), g.questions["4"], JSON.parse(g.questions["5"]).join(' or '), g.questions["6"], g.questions["7"], g.questions["8"], g.questions["9"], JSON.parse(g.questions["10"]).join(' or '), JSON.parse(g.questions["11"]).join(' or '), g.questions["11_other"], JSON.parse(g.questions["11_reason"]).join(' or '), g.questions["12"], JSON.parse(g.questions["13"]).join(' or '), JSON.parse(g.questions["14"]).join(' or '), g.questions["14_wallet"], JSON.parse(g.questions["15"]).join(' or '), JSON.parse(g.questions["16"]).join(' or '), JSON.parse(g.questions["16_reason"]).join(' or '), g.questions["17"], g.questions["18"], g.questions["19"], g.questions["20"], JSON.parse(g.questions["21"]).join(' or '), g.questions["22"], g.questions["23"]]
      end
    end
  end
end
