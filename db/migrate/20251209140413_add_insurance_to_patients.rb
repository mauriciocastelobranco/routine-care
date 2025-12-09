class AddInsuranceToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :insurance, :string
  end
end
