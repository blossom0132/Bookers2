class BooksController < ApplicationController

    def new
    end

    def create
  	  @newbook = Book.new(book_params)
      @newbook.user_id = current_user.id
  	  if @newbook.save
  	    redirect_to book_path(@newbook.id), notice: "You have creatad book successfully."
  	  else
        @books = Book.all
        @user = current_user
        render :index
      end
    end

    def index
      @newbook = Book.new
    	@books = Book.all
      @user = current_user
  end
    def show
   	    @book = Book.find(params[:id])
        @user = @book.user
        @newbook = Book.new
        # @books = @user.books
        # @books = Book.where(user_id: @user.id)
        # @user = User.find(id: @book.user_id)
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end
    def edit
        @book = Book.find(params[:id])
    end

    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path(@book.id), notice: "You have updated book successfully."
      else
        render :edit
      end
    end

    private
    def book_params
        params.require(:book).permit(:title, :body )
    end

end
