class CreateParticipents < ActiveRecord::Migration[6.1]
  def change
    create_table :participents do |t|
      t.string :name
      t.integer :trip_id
      t.timestamps null: false
    end
  end
end
