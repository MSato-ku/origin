class CreateChoicesEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :choices_events do |t|
      t.references :choice, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
