class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.datetime :date
      t.integer :length
      t.integer :checklist_id
      t.string :location

      t.timestamps
    end
  end
end
