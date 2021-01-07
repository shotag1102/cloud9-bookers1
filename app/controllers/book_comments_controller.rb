class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    if @book_comment.save
      redirect_to book_path(@book)
    else
      @book_comments = BookComment.where(book_id: @book.id)
      @user = current_user
      render 'books/show'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find(params[:id])
   if book_comment.user != current_user
    redirect_to book_path(@book)
   end
    book_comment.destroy
    redirect_to book_path(@book)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
