class AddBorrowedAndReturnedToUserBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :user_books, :borrowed_at, :datetime
    add_column :user_books, :returned_at, :datetime
  end
end
