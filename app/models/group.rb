class Group < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_and_belongs_to_many :entities

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
end
