class Care < ApplicationRecord
  belongs_to :patient
  belongs_to :caregiver

  validates :patient_id, uniqueness: { scope: :caregiver_id }
end
