class CreateBusLines < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_lines do |t|
      t.string :name, null: false
      t.string :from, null: false
      t.string :to, null: false

      t.timestamps
    end
  end
end
