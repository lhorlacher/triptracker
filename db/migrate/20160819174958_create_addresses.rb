class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false, default: 'United States'
      t.integer :zip, null: false
      t.belongs_to :location

      t.timestamps
    end
  end
end
