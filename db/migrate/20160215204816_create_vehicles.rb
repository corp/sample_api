class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.string :make
      t.integer :year
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
