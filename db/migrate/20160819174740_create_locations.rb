class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :where, required: true
      t.string :type
      t.integer :days
      t.belongs_to :trip

      t.timestamps
    end
  end
end
