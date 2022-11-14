class Group < ActiveRecord::Base

  has_many :entity, dependent: :destroy foreigh key: "group_id"
  has_many :user, dependent: :destroy foreigh key: "group_id"

    validates :name, presence: true


end