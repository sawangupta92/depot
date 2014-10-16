class RemoveRatingFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :rating
  end
end
