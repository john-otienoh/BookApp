class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def borrow
    update(borrowed_at: Time.current, returned_at: nil)
  end
  def return
    update(returned_at: Time.current)
  end
  def returned?
    returned_at.present?
  end

  # Check if the book is currently borrowed
  def borrowed?
    borrowed_at.present? && returned_at.nil?
  end
end
