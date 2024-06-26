class BooksController < ApplicationController
  
  before_action :is_matching_edit_book , only: [:edit]
  
  def new
    @book = Book.new  
  end
  
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to @book
    else
      @books = Book.all
      render :index
    end
    
    
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @apple = Book.new
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
    
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to @book 
    else
      render :edit
    end
    
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)  
  end
  
  def is_matching_edit_book 
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end
    
end
