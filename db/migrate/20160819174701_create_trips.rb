class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.text :notes
      t.date :begin
      t.date :end
      t.string :people

      t.timestamps
    end
  end
end
