class BooksController < ApplicationController

  def index
    
    @books = Book.all
    
    @user = current_user
    
  end

  def show
    
    @book = Book.find(params[:id])
    

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
  
  def destroy
    
    book = Book.find(params[:id])
    
    book.destroy

    redirect_to '/books'
    
  end

  private

  def book_params
  
    params.require(:book).permit(:title, :body)
  
  end
 
end
