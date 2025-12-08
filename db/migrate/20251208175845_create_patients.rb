class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :birth

      t.timestamps
    end
  end
end
