class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :gender, :null => false, :default => 'other'
      t.string :role, :null => false, :default => 'regular'
      t.text :description
      t.date :birthday
      t.timestamps
    end
  end
end
