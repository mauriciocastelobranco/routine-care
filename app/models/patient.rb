class Patient < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :cares, dependent: :destroy
  has_many :caregivers, through: :cares
end
