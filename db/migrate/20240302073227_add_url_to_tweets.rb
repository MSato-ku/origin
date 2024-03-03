class AddUrlToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :url, :string
  end
end
