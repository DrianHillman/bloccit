class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  def display_favorites
    
    
  end
end
