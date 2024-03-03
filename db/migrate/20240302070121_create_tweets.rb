class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.string :prefecture
      t.string :people
      t.string :seat
      t.string :image
      t.text :comment
      t.string :price
      t.string :name
      t.integer :user_id
      t.string :personal

      t.timestamps
    end
  end
end
