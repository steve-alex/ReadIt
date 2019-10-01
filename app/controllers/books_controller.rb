class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = []
  end

  def select
    @book = Book.create(book_params)
    redirect_to book_path(@book)
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @reading_lists = current_user.reading_lists
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.find(params[:book_id]) #Book.new(book_params)
    @reading_list = ReadingList.find(params[:reading_list_id])
    @reading_list.books << @book
    
    respond_to do |format|
        format.html { redirect_to @book, notice: "Book was successfully added to #{@reading_list.name}." }
        format.json { render :show, status: :created, location: @book }
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @books = APIRequestMaker.new(params[:search_id], params[:query]).build_book_hash
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit!
    end
end