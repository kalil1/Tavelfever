class CreateUseritems < ActiveRecord::Migration[5.1]
  def change
    create_table :useritems do |t|
      t.string :name
      t.integer :checklist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
