class Care < ApplicationRecord
  belongs_to :patient
  belongs_to :caregiver
end
