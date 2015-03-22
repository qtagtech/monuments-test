class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image_uid
      t.string :title
      t.integer :user_id
      t.integer :monument_id

      t.timestamps null: false
    end
  end
end
