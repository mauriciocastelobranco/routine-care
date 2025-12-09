class AddInsuranceNumberToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :insurance_number, :string
  end
end
