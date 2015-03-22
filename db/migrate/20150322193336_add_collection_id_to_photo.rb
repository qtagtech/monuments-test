class AddCollectionIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :collection_id, :integer

  end
end
