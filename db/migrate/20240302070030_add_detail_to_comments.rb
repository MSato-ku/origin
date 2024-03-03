class AddDetailToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :content, :string
    add_column :comments, :fee_confirm, :string
    add_column :comments, :participate, :string
    add_column :comments, :attend, :integer
    add_column :comments, :name, :string
  end
end
