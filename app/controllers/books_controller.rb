class BooksController < ApplicationController
  def create
    
    author = Author.find_or_create_by(name: params[:author_name], email: params[:author_email])

    
    @book = Book.new(book_params.merge(author: author))

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  private

  
  def book_params
    params.require(:book).permit(:title) 
  end
end
