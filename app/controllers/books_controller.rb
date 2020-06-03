class BooksController < ApplicationController
  def index
  	  #記事を全件取得
  	  @books = Book.all
  	  @book = Book.new
  	  @books = Book.all.order(created_at: :desc)
  end

  def show
  	  @book = Book.find(params[:id]) 
  end

  def new
  	  @book = Book.new
  end

  def create
  	  @book = Book.new(book_params)
   if @book.save
   	  flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render 'index'
      flash[:error] = 'error'
    end
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def update
  	  @book = Book.find(params[:id])
  	 if @book.update(book_params)
  	  flash[:notice] = "Book was successfully updated."
  	  redirect_to book_path(@book)
  	 else
  	 	flash[:error] = 'error'
  	 	render 'edit'
       end
  end

  def destroy
  	  book = Book.find(params[:id])
  	  book.destroy
  	  flash[:notice] = "Book was successfully destroyed."
  	  redirect_to books_path
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end

