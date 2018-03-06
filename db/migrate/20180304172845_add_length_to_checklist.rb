class AddLengthToChecklist < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :length, :integer
  end
end
