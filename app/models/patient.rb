class Patient < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :medications
end
