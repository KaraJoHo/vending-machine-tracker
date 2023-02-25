class CreateSnack < ActiveRecord::Migration[5.2]
  def change
    create_table :snacks do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
