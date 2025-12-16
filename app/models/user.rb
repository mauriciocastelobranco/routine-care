class User < ApplicationRecord
  has_many :patients, dependent: :destroy
  has_one :caregiver, dependent: :destroy
  has_many :chats
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
