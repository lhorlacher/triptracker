class CreatePackItems < ActiveRecord::Migration[5.0]
  def change
    create_table :pack_items do |t|
      t.string :name
      t.string :notes
      t.string :is_like
      t.string :location, null: false
      t.boolean :packed, default: false
      t.belongs_to :trip

      t.timestamps
    end
  end
end
