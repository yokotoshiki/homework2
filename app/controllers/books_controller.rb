class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
  	  @book = Book.new
  end

  def create
  	  book = Book.new(book_params)
  	  book.save
      redirect_to bool_path
  end

  def edit
  end
end
