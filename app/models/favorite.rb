class Favorite < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :book_id
  belongs_to :user
  belongs_to :book
  validates :user_id, presence: true  
  validates :book_id, presence: true 
end
