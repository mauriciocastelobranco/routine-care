class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :title
      t.date :occurs_at
      t.string :specialty
      t.text :notes

      t.timestamps
    end
  end
end
