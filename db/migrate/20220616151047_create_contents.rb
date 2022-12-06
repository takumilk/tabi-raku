class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.integer :plannumber
      t.datetime :times
      t.string :activity
      t.integer :trip_id
      t.timestamps null: false
    end
  end
end
