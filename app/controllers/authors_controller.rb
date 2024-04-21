class AuthorsController < ApplicationController

  def new
    @author = Author.new
  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
    author = Author.new(author_params)
    if author.save
      redirect_to author_path(author), notice: "Author created successfully."
    else
      render :new
    end

    def update
      author = Author.find(params[:id])
      if author.update(author_params)
        redirect_to author_path(author), notice: "Author updated successfully."
      else
        render :edit
      end

      def destroy
        author = Author.find(params[:id])
        author.destroy
        redirect_to authors_path, notice: "Author deleted successfully."
      end
    
      private
    
      def author_params
        params.require(:author).permit(:name, :email, :bio)
      end
    end
end
