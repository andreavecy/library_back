class FavoriteBooksController < ApplicationController
  before_action :set_favorite_book, only: %i[ show update destroy ]

  # GET /favorite_books
  def index
    @favorite_books = FavoriteBook.all

    render json: @favorite_books
  end

  # GET /favorite_books/1
  def show
    render json: @favorite_book
  end

  # POST /favorite_books
  def create
    @favorite_book = FavoriteBook.new(favorite_book_params)

    if @favorite_book.save
      render json: @favorite_book, status: :created, location: @favorite_book
    else
      render json: @favorite_book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorite_books/1
  def update
    if @favorite_book.update(favorite_book_params)
      render json: @favorite_book
    else
      render json: @favorite_book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorite_books/1
  def destroy
    @favorite_book.destroy
  end

  def my_favorite_books
    @favorite_books = Book.where(FavoriteBook.where(user_id: params[:user_id]).pluck(:book_id))
    render json: @favorite_books
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_book
      @favorite_book = FavoriteBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_book_params
      params.require(:favorite_book).permit(:user_id, :book_id)
    end
end
