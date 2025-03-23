class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show new edit update destroy search ]

  def index
    @books = Book.all
    @user = current_user
  end

  def show
  end

  def new
    @book = Book.new
  end

  def search
    if params[:search].blank?
      redirect_to books_path
      flash.now[:alert] = "Empty field!"
    else
      @parameter = params[:search].downcase
      @results = Book.all.where("lower(title) LIKE ? OR lower(author) LIKE ?", "%#{@parameter}%", "%#{@parameter}%")
      # if @results.empty?
      #   flash.now[:notice] = ""
      # end
    end
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end
  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
