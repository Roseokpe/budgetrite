class Purchase < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  
    has_many :category_purchases
    has_many :categories, through: :category_purchases
  
    validates :name, :amount, presence: true
    validates :amount, numericality: { greater_than_or_equal_to: 0 }
  end