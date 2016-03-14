class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :topic, polymorphic: true
  belongs_to :user
  
  validates :body, length: {minimum: 5}, presence: true
  validates :user, presence: true
end
