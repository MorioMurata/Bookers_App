class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    flash[:notice] = "Book was successfully created."
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    flash[:notice] = "Book was successfully updated."
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Book was successfully destroyed."
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
