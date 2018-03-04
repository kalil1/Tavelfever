class CreateJoinTableChecklistsItems < ActiveRecord::Migration[5.1]
  def change
    create_join_table :checklists, :items do |t|
      # t.index [:checklists_id, :items_id]
      # t.index [:items_id, :checklists_id]
    end
  end
end
