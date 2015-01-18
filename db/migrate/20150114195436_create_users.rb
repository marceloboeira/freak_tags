class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :gender
      t.text :description
      t.date :birthday
      t.timestamps
    end
  end
end
