class Entity < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true
end
