class AddImageUrlToBuckets < ActiveRecord::Migration[5.0]
  def change
    add_column :buckets, :image_url, :string
  end
end
