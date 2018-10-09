class Contact < ApplicationRecord
  has_many :contact_phones
  has_many :contact_addresses
end
