class CreateAdvisors < ActiveRecord::Migration
  def change
    create_table :advisors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
