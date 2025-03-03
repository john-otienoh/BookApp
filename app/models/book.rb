class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  has_many :user_books
  has_many :users, through: :user_books
  def borrowed_by?(user)
    user_books.where(user: user, returned_at: nil).exists?
  end
  def borrow(user)
    user_book = user_books.find_or_initialize_by(user: user)
    if user_book.new_record? || user_book.returned?
      user_book.update(borrowed_at: Time.current, returned_at: nil)
    else
      false
    end
  end

  def return(user)
    user_book = user_books.find_by(user: user)
    if user_book && user_book.borrowed?
      user_book.update(returned_at: Time.current)
    else
      false
    end
  end
end
