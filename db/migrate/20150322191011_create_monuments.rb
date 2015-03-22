class CreateMonuments < ActiveRecord::Migration
  def change
    create_table :monuments do |t|
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
