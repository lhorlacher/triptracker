class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street, required: true
      t.string :city, required: true
      t.string :state, required: true
      t.string :country, required: true, default: 'United States'
      t.integer :zip, required: true
      t.belongs_to :location

      t.timestamps
    end
  end
end
