class BooksController < ApplicationController
  def index
  	  #記事を全件取得
  	  @books = Book.all
  end

  def show
  	  @book = Book.find(params[:id]) 
  end

  def new
  	  @book = Book.new
  end

  def create
  	  book = Book.new(book_params)
  	  book.save
      redirect_to book_path(book.id)
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def update
  	  book = Book.find(paramd[:id])
  	  book.update(book_params)
  	  redirect_to book_path(book)
  end

  def destroy
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redict_to book_path


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end

