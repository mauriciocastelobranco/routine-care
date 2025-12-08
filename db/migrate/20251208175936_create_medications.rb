class CreateMedications < ActiveRecord::Migration[7.1]
  def change
    create_table :medications do |t|
      t.string :name
      t.references :patient, null: false, foreign_key: true
      t.string :dosage

      t.timestamps
    end
  end
end
