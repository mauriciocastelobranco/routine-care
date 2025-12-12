class Patient < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :medications
  has_many :chats, dependent: :destroy
end
