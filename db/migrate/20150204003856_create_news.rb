class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title, :null => false
      t.string :slug, :null => false, :unique => true
      t.string :slug_line, :null => false
      t.text :content
      t.references :author, references: :users
      t.timestamps
    end
    add_index :news, :slug, unique: true
  end
end
