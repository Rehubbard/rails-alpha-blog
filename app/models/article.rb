class Article < ApplicationRecord
  # defines one-to-many relationship with users table
  belongs_to :user
  # define many-to-many relationship with categories
  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true 
end