class AddListIdToChecklists < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :list_id, :integer
  end
end
