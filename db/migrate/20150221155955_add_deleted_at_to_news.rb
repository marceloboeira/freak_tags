class AddDeletedAtToNews < ActiveRecord::Migration
  def change
    add_column :news, :deleted_at, :datetime
    add_index :news, :deleted_at
  end
end
