class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :zip_code, :street, :city, presence: true
end
