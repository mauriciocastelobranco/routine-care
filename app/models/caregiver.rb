class Caregiver < ApplicationRecord
  belongs_to :user
  has_many :cares, dependent: :destroy
  has_many :patients, through: :cares

  # def caregiver_email
  #   user.email
  # end
end
