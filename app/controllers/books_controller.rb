class BooksController < ApplicationController

  def index
    @books = []
  end

  def select
    @book = Book.find_by(google_id: book_params[:google_id])
    
    unless @book
      @book = Book.create(book_params)
    end

    redirect_to book_path(@book)
  end

  def show
    @book = Book.find(params[:id])
    @reading_lists = current_user.reading_lists
    @reviews = @book.reviews
  end

  def archivebook
    @book = Book.find(params[:book_id])
    @reading_list = ReadingList.find(params[:reading_list_id])

    if @reading_list.books.include?(@book)
      respond_to do |format|
        format.html { redirect_to @book, notice: "Book is already in #{@reading_list.name}." }
        format.json { render :show, status: :created, location: @book }
      end
    else
      if current_user.books.include?(@book)
        ReadingListBook.find_by(reading_list_id: current_user.reading_list_containing(@book).id, book_id: @book.id).destroy
        respond_to do |format|
          format.html { redirect_to @book, notice: "Book was successfully moved to #{@reading_list.name}." }
          format.json { render :show, status: :created, location: @book }
        end
      else
        respond_to do |format|
          format.html { redirect_to @book, notice: "Book was successfully added to #{@reading_list.name}." }
          format.json { render :show, status: :created, location: @book }
        end
      end
      @reading_list.books << @book
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @request = APIRequestMaker.new()
    @results = @request.api_results(params[:search_id], params[:query], params[:num_results_id])
    @books = @request.build_book_hash(@results)
    if @books.empty?
      @message = "Your search did not return any results"
    else
      @message = ""
    end
    
    render :index
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.permit(:authors, :categories, :description, :google_id, :image_url, :language, :page_count, :subtitle, :title)
    end
end