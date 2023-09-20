class UsersController < ApplicationController

  def show
    
    @book = Book.new
    
    @user =User.find(params[:id])
    
    @books = @user.books
    
    @book_new = Book.new 
    
  end
  
  def cleate
  end
  
  def index
    
    @user = current_user
    
    @users = User.all
    
    @book_new = Book.new 
    
  end
  
  def edit
    
    is_matching_login_user
    
    @user = User.find(params[:id])
    
  end
  
  def update
    
    is_matching_login_user
    
    @user = Book.find(params[:id])
    
    if @user.update(user_params)
    
      flash[:notice] = "You have updated user successfully."
    
      redirect_to user_path(@user.id)
    
    else
      
      render :edit
    
    end
  
  end

  private

  def  is_matching_login_user
  
    user_id = params[:id]
   
    login_user_id = current_user.id
  
    if(user_id != login_user_id)
    
      redirect_to user_path(login_user_id)
  
    end
    
  end

  def user_params
  
    params.require(:user).permit(:name, :introduction, :profile_image)
  
  end
  
end