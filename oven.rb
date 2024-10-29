class Oven < ActiveRecord::Base
  belongs_to :user
  has_one :batch_cookie, as: :storage, dependent: :destroy

  validates :user, presence: true
end
