class AddDestinationToChecklist < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :destination, :string
  end
end
