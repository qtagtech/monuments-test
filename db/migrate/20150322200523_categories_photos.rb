class CategoriesPhotos < ActiveRecord::Migration
  def self.up
    create_table :categories_photos, :id => false do |t|
      t.integer :photo_id
      t.integer :category_id
    end

    add_index :categories_photos, [:photo_id, :category_id]
  end

  def self.down
    drop_table :categories_photos
  end
end
