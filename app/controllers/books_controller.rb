class BooksController < ApplicationController
  
  def new 
    @book = Book.new
  end
  
  
  def create
     book = Book.new(book_params)
     book.save
    redirect_to book_path(book.id)
  end

  def index
    @book =Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
      book = Book.find(params[:id])
      book.update(book_params)
      redirect_to book_path(book.id)
  end
  
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end  
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.save
     flash[:notice] = "Book was successfully update."
      redirect_to book_path(@book.id)
    else
      render :edit
    end  
  end
  
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
   
  
end
