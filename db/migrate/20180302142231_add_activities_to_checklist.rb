class AddActivitiesToChecklist < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :activities, :array
  end
end
