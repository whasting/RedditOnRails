class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.text :session_token, null: false, unique: true
      t.text :password_digest, null: false
      t.timestamps null: false
      t.index :email
      t.index :session_token
    end
  end
end
