class Redemption < ActiveRecord::Base
  validates_presence_of  :email, :name, :address, :contact_number
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
