class CreateRegions < ActiveRecord::Migration[7.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :ancestry

      t.timestamps
    end
  end
end
