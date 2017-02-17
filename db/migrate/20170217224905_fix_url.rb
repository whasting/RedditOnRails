class FixUrl < ActiveRecord::Migration
  def change
    change_column :posts, :url, :string, null: true
  end
end
