class Redemption < ActiveRecord::Base
  validates_presence_of  :email, :name, :address, :contact_number
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def self.to_csv
    require 'csv'
    CSV.generate do |csv|
      csv << ["Email", "Name", "Address", "Pin Code", "Contact Number", "T shirt size", "User Id", "event"]
      all.each do |r|
        csv << [r.email, r.name, r.address, r.pin_code, r.contact_number, r.t_shirt_size, r.app_user_id, r.event]
      end
    end
  end

end
