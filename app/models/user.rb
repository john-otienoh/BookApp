class User < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :user_books
  has_many :books, through: :user_books

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true
  validates_format_of :email_address,  with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email address"
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password_confirmation, presence: true
end
