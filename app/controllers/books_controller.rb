class BooksController < ApplicationController
  
  def new
    @book = Book.new  
  end
  
  def create
    book = Book.new(book_params)
    
    @book.user_id = current_user.id
    
    book.save
   
    redirect_to '/top'
  end

  def index
    @book = Book.new(book_params)
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion, :image)  
  end
    
end
