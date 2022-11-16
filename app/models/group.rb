class Group < ActiveRecord::Base

  has_many :entity, dependent: :destroy foreign key: "group_id"
  has_many :user, dependent: :destroy foreign key: "group_id"

  validates :name, presence: true
end