class Order < ApplicationRecord
  belongs_to :shippig_type
  belongs_to :user
end
