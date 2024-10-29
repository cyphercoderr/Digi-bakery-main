class Order < ApplicationRecord
  validates :customer_name, presence: true
  validates :item, presence: true
  validates :pick_up_at, presence: true
end
