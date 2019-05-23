class UsersController < ApplicationController

  before_action :authenticate_user!

  def show

    @user = User.find(params[:id])
    @book = Book.new

  end

  def index

    @book = Book.new
    @users = User.all.order(id: "DESC")

  end

  def create

    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to user_path(book)
    end

  end

  def edit

    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end

  end

  def update

    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end

  end

  def destroy

    book = Book.find(params[:id])

    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      # redirect_to
    end

  end

  private

   def book_params
    params.require(:book).permit(:title, :body)
   end

   def user_params
   	params.require(:user).permit(:name, :profile_image, :introduction)
   end
end
