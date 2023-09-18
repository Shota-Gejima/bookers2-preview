class BooksController < ApplicationController

  def index
    
    @books = Book.all
    
    @book = Book.find(current_user.id)

    
  end

  def show
    
    @book = Book.find(params[:id])
    
    # @user_book = User.find(params[:id])
    
    # @user_book.get_profile_image
    
    
  end
  
  def create
    
    # @books = @books.all
    
    @book = Book.new(book_params)
    
    @book.user_id = current_user.id
    
    @book.save
    
    redirect_to book_path(@book.id)
    
  end
  
  
  def edit
    
  end

  private

  def book_params
  
    params.require(:book).permit(:title, :body)
  
  end
 
end
