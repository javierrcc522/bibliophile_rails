class BooksController < ApplicationController
  def index
    @booksX = Book.ordered_by_genre
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
       redirect_to  books_path
     else
       render :new
     end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book= Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
     params.require(:book).permit(:genre)
 end
end
