class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :party_name
      t.date :date
      t.time :time
      t.string :restaurant_name
      t.integer :fee
      t.text :memo
      t.integer :group_id
      t.integer :user_id
      t.string :url

      t.timestamps
    end
  end
end
