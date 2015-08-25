class AddCategoryIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :category_id, :integer
  end
end
