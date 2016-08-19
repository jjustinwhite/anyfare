class AddIDsToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :bucket_id, :integer
    add_column :trips, :city_id, :integer
  end
end
