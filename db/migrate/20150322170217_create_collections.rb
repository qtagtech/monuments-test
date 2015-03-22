class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.string :name
      t.text :description
    end
  end
end
