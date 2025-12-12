class Caregiver < ApplicationRecord
  belongs_to :user
  belongs_to :patient

  def caregiver_email
    user.email
  end
end
