class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :planner
      t.string :planname
      t.string :purpose
      t.string :meetplace
      t.string :precaution
      t.timestamps null: false
    end
  end
end
