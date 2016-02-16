class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :service_center, index: true, foreign_key: true
      t.references :advisor, index: true, foreign_key: true
      t.references :vehicle, index: true, foreign_key: true
      t.integer :appointment_type
      t.datetime :start_date

      t.timestamps null: false
    end
  end
end
