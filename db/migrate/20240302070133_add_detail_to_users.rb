class AddDetailToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :profile, :text
    add_column :users, :image, :string
  end
end
