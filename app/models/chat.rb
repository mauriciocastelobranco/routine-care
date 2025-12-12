class Chat < ApplicationRecord
  belongs_to :patient
  belongs_to :user
  has_many :messages, dependent: :destroy
end
