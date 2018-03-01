class AddActivityIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :activity_id, :integer
  end
end
