class PhotosCategories < ActiveRecord::Migration
  def self.up
    create_table :photos_categories, :id => false do |t|
      t.integer :photo_id
      t.integer :category_id
    end

    add_index :photos_categories, [:photo_id, :category_id]
  end

  def self.down
    drop_table :photos_categories
  end
end
