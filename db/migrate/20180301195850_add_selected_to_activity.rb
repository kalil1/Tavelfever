class AddSelectedToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :selected, :boolean
  end
end
