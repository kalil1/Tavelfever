class AddChecklistIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :checklist_id, :integer
  end
end
