class Care < ApplicationRecord
  belongs_to :patient
  belongs_to :caregiver

  validates :patient_id, uniqueness: { scope: :caregiver_id }
  validates :caregiver_id, uniqueness: { scope: :patient_id }
  attr_accessor :email
end
