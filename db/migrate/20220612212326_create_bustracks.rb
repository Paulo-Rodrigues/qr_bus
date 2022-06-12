class CreateBustracks < ActiveRecord::Migration[7.0]
  def change
    create_table :bustracks do |t|
      t.string :start_time
      t.string :end_time
      t.references :bus_line, null: false, foreign_key: true

      t.timestamps
    end
  end
end
