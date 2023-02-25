class RemoveNameFromMachine < ActiveRecord::Migration[5.2]
  def change
    remove_column :machines, :name
  end
end
