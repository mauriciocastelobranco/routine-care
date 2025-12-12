class User < ApplicationRecord
  has_many :patients
  has_one :caregiver
  has_many :chats, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
