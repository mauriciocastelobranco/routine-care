class User < ApplicationRecord
  has_many :patients
  has_one :caregiver

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
