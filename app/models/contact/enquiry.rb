class Contact::Enquiry < ActiveRecord::Base
  audited
  validates_presence_of  :name, :email, :message
end
