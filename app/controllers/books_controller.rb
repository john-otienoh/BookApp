class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit borrow update destroy ]
  allow_unauthenticated_access only: %i[ index show new create edit update destroy]
  # before_action :require_login, only: %i[borrow ]
  def index
    @books = Book.all
    @users = User.all
  end

  def show
    @users = @book.users
    @user_books = UserBook.new
  end
  def borrow
    @user = current_user
    @user_book = @book.user_books.create(user: @user)
    @user_book.borrow
    redirect_to @book, notice: "Book borrowed successfully."
  end
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Book added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book update successful."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book deleted successfully."
  end

  private
    def set_book
      puts "set_book called with params[:id] = #{params[:id]}"
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author)
    end
   
end
