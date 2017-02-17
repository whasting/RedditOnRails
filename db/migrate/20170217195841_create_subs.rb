class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false, unique: true
      t.text :description, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
      t.index :user_id
    end
  end
end
