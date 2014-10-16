class Rating < ActiveRecord::Base
  validates_uniqueness_of :user_id, { scope: :product_id} 
  RATINGS = [ 1, 2, 3, 4, 5 ]
  validates :rating, :inclusion => {:in => RATINGS}
end
