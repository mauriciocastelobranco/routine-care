class CreateCares < ActiveRecord::Migration[7.1]
  def change
    create_table :cares do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :caregiver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
