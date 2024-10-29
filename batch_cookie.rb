class BatchCookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: :true
  
  validates :storage, presence: true

  enum status: %w{ unfinished cooking ready }
end
