class BooksController < ApplicationController
  
  def new
    @book = Book.new  
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      flash[:alert] = "Book not found."
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      flash[:alert] = "Book not found."
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path  
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image)  
  end
    
end
