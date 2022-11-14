class User < ApplicationRecord

    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable

    has_many :group, dependent: :destroy foreigh key: "user_id"
    has_many :entity, dependent: :destroy foreigh key: "user_id"

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
end