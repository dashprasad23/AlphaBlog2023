class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105}, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :username, presence: true, length: {minimum: 3, maximum: 25},
            uniqueness: {case_sensitive: false}
  has_many :articles
end
