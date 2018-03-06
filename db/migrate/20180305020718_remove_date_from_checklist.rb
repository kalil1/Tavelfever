class RemoveDateFromChecklist < ActiveRecord::Migration[5.1]
  def change
    remove_column :checklists, :date, :datetime
  end
end
